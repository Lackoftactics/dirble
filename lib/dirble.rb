require 'active_support/all'
require 'dirble/errors'
require 'dirble/configurable'
require 'dirble/connection'
require 'dirble/category'

require 'dirble/version'

module Dirble
  class << self
    include Dirble::Configurable
  end
end
