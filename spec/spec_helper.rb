require 'coveralls'
Coveralls.wear!

require 'active_object'
require 'pathname'
require 'generator_spec'

spec_tmp_path = Pathname.new(File.expand_path('../spec/lib/generators/tmp', File.dirname(__FILE__)))

RSpec.configure do |config|
  config.after(:all) { FileUtils.remove_dir(spec_tmp_path) if File.directory?(spec_tmp_path) }
end
