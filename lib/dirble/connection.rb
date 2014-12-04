require_relative 'query_executer'
require 'typhoeus'
require 'typhoeus/adapters/faraday'

module Dirble
  class Connection
    DIRBLE_API_URL = 'http://api.dirble.com/v1'

    def exec_query(query_params)
      QueryExecuter.new(connection, query_params).execute
    end

    private

    def connection
      @connection ||= begin
                        Faraday.new(url: DIRBLE_API_URL) do |faraday|
                          faraday.request :url_encoded
                          faraday.response :logger
                          faraday.adapter :typhoeus
                        end
                      end
    end
  end
end
