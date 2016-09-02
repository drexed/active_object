require 'spec_helper'

describe ActiveObject::Settings do

  after(:all) do
    ActiveObject::Settings.configure do |config|
      config.autoload_array = true
    end
  end

  describe '#configure' do
    it 'to be "91 test"' do
      ActiveObject::Settings.configure do |config|
        config.autoload_array = '91 test'
      end

      expect(ActiveObject::Settings.config.autoload_array).to eq('91 test')
    end
  end

end
