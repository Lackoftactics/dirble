module Dirble
  class QueryExecuter

    def initialize(connection, query_params)
      self.connection = connection
      self.request_type = query_params[:request_type]
      self.query = query_params[:query]
    end

    def execute
    end

    private

    attr_accessor :connection, :request_type, :query


  end
end
