require 'yo_client/version'
require 'faraday'
require 'faraday_middleware'

module YoClient
  class Client
    # Constructor
    # @param [String] token Yo API Token
    def initialize(api_token)
      @api_token = api_token
      @faraday = Faraday.new(url: 'http://api.justyo.co') do |faraday|
        faraday.request  :url_encoded
        faraday.response :json
        faraday.adapter  :net_http
      end
    end

    # Yo to all subscribers
    def yoall
      @faraday.post '/yoall/', token_hash
    end

    # Yo to specific user
    # @param [String] username
    def yo(username)
      @faraday.post '/yo/', token_hash.merge(username: username.upcase)
    end

    # Get a number of subscribers
    # @return [Integer] number of subscribers
    def subscribers_count
      response = @faraday.get '/subscribers_count/', token_hash
      response.body['result']
    end

    private
      def token_hash
        { api_token: @api_token }
      end
  end
end
