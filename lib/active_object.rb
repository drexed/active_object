require 'active_object/version'
require 'active_object/configuration'

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

require 'active_object/array' if ActiveObject.configuration.array
require 'active_object/date' if ActiveObject.configuration.date
require 'active_object/enumerable' if ActiveObject.configuration.enumerable
require 'active_object/hash' if ActiveObject.configuration.hash
require 'active_object/integer' if ActiveObject.configuration.integer
require 'active_object/numeric' if ActiveObject.configuration.numeric
require 'active_object/object' if ActiveObject.configuration.object
require 'active_object/range' if ActiveObject.configuration.range
require 'active_object/string' if ActiveObject.configuration.string
require 'active_object/time' if ActiveObject.configuration.time

require 'generators/active_object/install_generator'
