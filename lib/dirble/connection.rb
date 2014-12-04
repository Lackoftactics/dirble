module Dirble
  class Connection

    def initialize(options)
      self.api_key = options[:api_key]
    end

    private

    attr_accessor :api_key
  end
end
