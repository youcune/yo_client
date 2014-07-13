require 'spec_helper'

describe YoClient do
  it 'has a version number' do
    expect(YoClient::VERSION).not_to be nil
  end

  it 'can create instance' do
    expect(YoClient::Client.new('test')).to be_an_instance_of(YoClient::Client)
  end

  describe 'Instance of YoClient::Client' do
    before do
      @client = YoClient::Client.new('test')
    end

    describe '#yoall' do
      it 'hooks POST /yoall/' do
        expect_any_instance_of(Faraday::Connection).to(
          receive(:post)
            .with('/yoall/', { api_token: 'test' })
            .and_return(double('yo', body: {}, success?: true))
        )
        @client.yoall
      end
    end

    describe '#yo' do
      it 'hooks POST /yo/' do
        expect_any_instance_of(Faraday::Connection).to(
          receive(:post)
            .with('/yo/', { api_token: 'test', username: 'YOUCUNE' })
            .and_return(double('yo', body: {}, success?: true))
        )
        @client.yo('youcune')
      end
    end

    describe '#subscribers_count' do
      it 'hooks GET /subscribers_count/' do
        expect_any_instance_of(Faraday::Connection).to(
          receive(:get)
            .and_return(double('subscribers_count', body: { 'result' => 5 }))
        )
        expect(@client.subscribers_count).to eq 5
      end
    end
  end
end
