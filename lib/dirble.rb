require 'dirble/errors'
require 'dirble/configurable'
require 'dirble/connection'

require 'dirble/version'

module Dirble
  class << self
    include Dirble::Configurable
  end
end
