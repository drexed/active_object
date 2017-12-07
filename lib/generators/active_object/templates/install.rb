# frozen_string_literal: true

ActiveObject.configure do |config|
  config.autoload_array = true
  config.autoload_date = true
  config.autoload_enumerable = true
  config.autoload_hash = true
  config.autoload_integer = true
  config.autoload_kernel = true
  config.autoload_numeric = true
  config.autoload_object = true
  config.autoload_range = true
  config.autoload_string = true
  config.autoload_time = true
end
