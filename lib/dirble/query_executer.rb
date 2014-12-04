module Dirble
  class QueryExecuter
    REQUEST_TYPES = [:get, :post, :put, :delete, :patch]

    def initialize(connection, query_params)
      self.connection = connection
      self.request_type = query_params[:request_type]
      self.query = query_params[:query]
    end

    def execute
      guard_query_params
      replace_placeholder_with_api_key
      connection.send(request_type, query)
    end

    private

    attr_accessor :connection, :request_type, :query

    def guard_query_params
      raise Dirble::Errors::InvalidRequestType, 'Bad request type provided. Please use :get or :post' unless REQUEST_TYPES.include?(request_type)
    end

    def replace_placeholder_with_api_key
      query.gsub!("{{api_key}}", Dirble.api_key)
    end
  end
end
