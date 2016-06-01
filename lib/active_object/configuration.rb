class ActiveObject::Configuration

  attr_accessor :autoload_array, :autoload_date, :autoload_enumerable,
                :autoload_hash, :autoload_integer, :autoload_numeric,
                :autoload_object, :autoload_range, :autoload_string,
                :autoload_time

  def initialize
    @autoload_array = true
    @autoload_date = true
    @autoload_enumerable = true
    @autoload_hash = true
    @autoload_integer = true
    @autoload_numeric = true
    @autoload_object = true
    @autoload_range = true
    @autoload_string = true
    @autoload_time = true
  end

end
