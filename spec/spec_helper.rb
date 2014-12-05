require 'simplecov'
require 'coveralls'

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter 'lib'
end

require 'pry'
require 'webmock/rspec'
require 'dirble'
require 'support/fake_dirble_api'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:any, /api.dirble.com/).to_rack(FakeDirbleApi)
  end
end

def configure_dirble
  Dirble.configure do |config|
    config.api_key = "valid_api_key"
  end
end
