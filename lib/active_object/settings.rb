require 'dry-configurable'

class ActiveObject::Settings
  extend Dry::Configurable

  setting :autoload_array, true
  setting :autoload_date, true
  setting :autoload_enumerable, true
  setting :autoload_hash, true
  setting :autoload_integer, true
  setting :autoload_numeric, true
  setting :autoload_object, true
  setting :autoload_range, true
  setting :autoload_string, true
  setting :autoload_time, true

end
