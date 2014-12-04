require 'spec_helper'

describe Dirble::Connection do

  let!(:connection)   { Dirble::Connection.new(api_key: 'api_key') }
  let!(:status_query) { { request_type: :get, query: '/status' } }

  before do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get('/status') { |env| [200, {}, 'ok'] }
    end
  end

  it 'can execute queries' do
    expect(connection.exec_query(status_query).response).to eq(200)
  end
end

