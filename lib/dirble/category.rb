module Dirble
  class Category
    attr_accessor :id, :name, :description

    def initialize(options)
      self.id = options[:id]
      self.name = options[:name]
      self.description = options[:description]
    end

    def self.all
      response = Dirble.connection.exec_query(
        request_type: :get,
        query: 'categories/apikey/{{api_key}}'
      ).body
      build_from_api_response(response)
    end

    def self.primary
      response = Dirble.connection.exec_query(
        request_type: :get,
        query: 'primaryCategories/apikey/{{api_key}}'
      ).body
      build_from_api_response(response)
    end

    def self.build_from_api_response(response)
      parsed = JSON.parse(response)
      categories = Array(parsed)
      categories.each_with_object([]) do |category_params, collection|
        collection << Category.new(category_params.with_indifferent_access)
      end
    end
  end
end
