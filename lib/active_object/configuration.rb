# frozen_string_literal: true

module ActiveObject
  class Configuration

    attr_accessor :autoload_array, :autoload_date, :autoload_enumerable, :autoload_hash,
                  :autoload_integer, :autoload_kernel, :autoload_numeric, :autoload_object,
                  :autoload_range, :autoload_string, :autoload_time

    # rubocop:disable Metrics/MethodLength
    def initialize
      @autoload_array = true
      @autoload_date = true
      @autoload_enumerable = true
      @autoload_hash = true
      @autoload_integer = true
      @autoload_kernel = true
      @autoload_numeric = true
      @autoload_object = true
      @autoload_range = true
      @autoload_string = true
      @autoload_time = true
    end
    # rubocop:enable Metrics/MethodLength

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
