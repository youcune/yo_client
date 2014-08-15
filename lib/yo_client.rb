require 'yo_client/version'
require 'faraday'
require 'faraday_middleware'

module YoClient
  class Client
    # Constructor
    # @param [String] api_token Yo API Token
    def initialize(api_token)
      @api_token = api_token
      @faraday = Faraday.new(url: 'http://api.justyo.co') do |faraday|
        faraday.request  :url_encoded
        faraday.response :json
        faraday.adapter  :net_http
      end
    end

    # Yo to all subscribers
    # @param [Hash] options allowed only link for now
    # @return [Boolean] if request has succeed
    def yoall(options = {})
      response = connection_wrapper {
        @faraday.post '/yoall/', token_hash.merge(options)
      }
      response.success?
    end

    # Yo to specific user
    # @param [String] username usename to send yo
    # @param [Hash] options allowed only link for now
    # @return [Boolean] if request has succeed
    def yo(username, options = {})
      options.merge!(username: username.upcase)
      response = connection_wrapper {
        @faraday.post '/yo/', token_hash.merge(options)
      }
      response.success?
    end

    # Get a number of subscribers
    # @return [Integer] number of subscribers
    def subscribers_count
      response = connection_wrapper {
        @faraday.get '/subscribers_count/', token_hash
      }
      response.body['result']
    end

    private
      # Connect with error handling
      # @param [Proc] block
      def connection_wrapper(&block)
        begin
          response = block.call
          raise ClientError.new(response.body['error']) if response.body.has_key?('error')
        rescue Faraday::ParsingError => e
          # Has gotten a response, but it is not formatted with JSON
          raise ClientError.new(e.message)
        rescue Faraday::ClientError => e
          # Failed to build a connection
          raise ConnectionError.new(e.message)
        end

        response
      end

      # Returns hash for every request
      # @return [Hash] hash for every request
      def token_hash
        { api_token: @api_token }
      end
  end

  class ConnectionError < StandardError; end
  class ClientError < StandardError; end
end
