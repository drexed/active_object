require 'rails/generators'

class ActiveObject::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_initializer_file
    copy_file('install.rb', 'config/initializers/active_object.rb')
  end

end
