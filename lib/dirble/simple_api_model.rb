module Dirble
  module SimpleApiModel
    def call_api_with_results(query_params)
      response = Dirble.connection.exec_query(query_params).body
      build_from_api_response(response)
    end

    def build_from_api_response(response)
      parsed_collection(json_response).each_with_object([]) do |object_params, collection|
        collection << target_class.new(object_params.with_indifferent_access)
      end
    end

    def parsed_collection(json_response)
      Array(JSON.parse(json_response))
    end
  end
end
