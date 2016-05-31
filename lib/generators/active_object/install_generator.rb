require 'rails/generators'

module ActiveObject
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def copy_initializer_file
      copy_file('install.rb'.freeze, 'config/initializers/active_object.rb'.freeze)
    end

  end
end
