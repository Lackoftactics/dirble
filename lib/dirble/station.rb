module Dirble
  class Station
    REQUIRED_FIELDS = [:name, :website, :directory]

    extend Dirble::SimpleApiModel

    attr_accessor :id, :name, :stream_url, :description, :website, :url_id,
      :song_history, :categories, :country, :bitrate, :status

    def initialize(options)
      self.id = options[:id]
      self.name = options[:name]
      self.website = options[:website]
      self.country = options[:country]
      self.bitrate = options[:bitrate]
      self.status = options[:status]
    end

    class << self

      def create(params)
        guard_creation_of_station(params)
        call_api_with_results(
          request_type: :post,
          query: 'station/apikey/{{api_key}}',
          form_fields: params
        ).first
      end

      def search(keyword)
        call_api_with_results(
          request_type: :get,
          query: "search/apikey/{{api_key}}/search/#{keyword.parameterize}"
        )
      end

      def by_continent(name)
        call_api_with_results(
          request_type: :get,
          query: "continent/apikey/{{api_key}}/continent/#{name.parameterize}"
        )
      end

      def by_country(code)
        call_api_with_results(
          request_type: :get,
          query: "country/apikey/{{api_key}}/country/#{code}"
        )
      end

      def count
        response = Dirble.connection.exec_query(
          request_type: :get,
          query: 'amountStation/apikey/{{api_key}}'
        ).body
        JSON.parse(response)['amount']
      end

      private

      def guard_creation_of_station(params)
        unless all_required_fields?(params.keys)
          raise ArgumentError, 'You forgot about one of this keys: name, website, directory'
        end
      end

      def all_required_fields?(keys)
        REQUIRED_FIELDS.all? { |required_field| keys.include?(required_field) }
      end
    end
  end
end
