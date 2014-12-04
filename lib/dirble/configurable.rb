module Dirble
  module Configurable
    attr_accessor :api_key, :connection

    def configure
      yield self
      prepare_connection
      self
    end

    def prepare_connection
      raise ArgumentError, 'You have to set api key in configure' unless self.api_key
      self.connection = Dirble::Connection.new
    end

    def reset!
      self.api_key = nil
    end
  end
end
