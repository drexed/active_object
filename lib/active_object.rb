require "active_object/version"
require "active_object/configuration"

module ActiveObject

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configuration=(config)
    @configuration = config
  end

  def self.configure
    yield(configuration)
  end

end

require "active_object/array"
require "active_object/date"
require "active_object/enumerable"
require "active_object/hash"
require "active_object/integer"
require "active_object/numeric"
require "active_object/object"
require "active_object/range"
require "active_object/string"
require "active_object/time"

require "generators/active_object/install_generator"
