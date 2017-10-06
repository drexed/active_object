# frozen_string_literal: true

%w[active_object pathname generator_spec].each do |file_name|
  require file_name
end

spec_tmp_path = Pathname.new(File.expand_path('../spec/lib/generators/tmp', File.dirname(__FILE__)))

RSpec.configure do |config|
  config.after(:all) { FileUtils.remove_dir(spec_tmp_path) if File.directory?(spec_tmp_path) }
end
