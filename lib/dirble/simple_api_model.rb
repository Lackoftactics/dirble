module Dirble
  module SimpleApiModel
    def call_api_with_results(options)
      factory_klass = options.delete(:factory_klass) || self
      response = Dirble.connection.exec_query(options).body
      build_from_api_response(factory_klass, response)
    end

    def build_from_api_response(target_class, response)
      parsed_collection(response).map do |object_params|
        target_class.new(object_params.with_indifferent_access)
      end
    end

    def parsed_collection(json_response)
      Array.wrap(JSON.parse(json_response))
    end
  end
end
