module Dirble
  class Category
    attr_accessor :id, :name, :description

    def initialize(options)
      self.id = options[:id]
      self.name = options[:name]
      self.description = options[:description]
    end

    def self.all
      call_api_with_results(
        request_type: :get,
        query: 'categories/apikey/{{api_key}}'
      )
    end

    def self.find(category_id)
      all.select { |category| category.id == category_id }.first
    end

    def self.first
      all.first
    end

    def self.primary
      call_api_with_results(
        request_type: :get,
        query: 'primaryCategories/apikey/{{api_key}}'
      )
    end
  end
end
