# frozen_string_literal: true

require 'spec_helper'

describe ActiveObject::Configuration do
  after(:all) do
    ActiveObject.configure do |config|
      config.autoload_array = true
    end
  end

  describe '#configure' do
    it 'to be "91 test"' do
      ActiveObject.configuration.autoload_array = '91 test'

      expect(ActiveObject.configuration.autoload_array).to eq('91 test')
    end
  end

end
