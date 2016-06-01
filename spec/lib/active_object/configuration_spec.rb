require "spec_helper"

describe ActiveObject::Configuration do

  after(:all) {
    ActiveObject.configure do |config|
      config.autoload_array = true
    end
  }

  describe "#configure" do
    it "to be '91 test'" do
      ActiveObject.configure do |config|
        config.autoload_array = "91 test"
      end

      expect(ActiveObject.configuration.autoload_array).to eq("91 test")
    end
  end

end
