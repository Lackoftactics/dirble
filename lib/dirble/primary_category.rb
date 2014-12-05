module Dirble
  class PrimaryCategory < Category

    def children
      response = Dirble.connection.exec_query(
        request_type: :get,
        query: "childCategories/apikey/{{api_key}}/primaryid/#{id}"
      ).body
      build_from_api_response(response)
    end

    def primary
      true
    end
  end
end
