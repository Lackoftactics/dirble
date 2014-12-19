require 'spec_helper'

describe Dirble::Connection do
  let!(:connection)   { Dirble::Connection.new }
  let!(:status_query) { { request_type: :get, query: '/status' } }

  before do
    stub_request(:get, 'http://api.dirble.com/status')
      .with(headers: { 'User-Agent' => 'Faraday v0.9.0' })
      .to_return(status: 200, body: '', headers: {})
  end

  context 'valid params' do
    it 'can execute queries' do
      expect(connection.exec_query(status_query).status).to eq(200)
    end
  end

  context 'invalid params' do
    it 'raises error on invalid request type' do
      invalid_request_type_query = status_query.merge(request_type: :poke)
      expect { connection.exec_query(invalid_request_type_query) }
        .to raise_error
    end
  end
end
