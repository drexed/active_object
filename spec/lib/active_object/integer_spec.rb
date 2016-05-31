require 'spec_helper'

describe Integer do

  describe "#factorial" do
    it "to be 24" do
      expect(4.factorial).to eq(24)
    end
  end

  describe "#of" do
    it "to be [1, 2, 3]" do
      expect(3.of { |i| i + 1 }).to eq([1, 2, 3])
    end
  end

  describe "#roman" do
    it "to be ''" do
      expect(0.roman).to eq("")
    end

    it "to be 'XLIX'" do
      expect(49.roman).to eq("XLIX")
    end

    it "to be '-XLIX'" do
      expect(-8.roman).to eq("-VIII")
    end
  end

  describe "#time" do
    it "to be 1969-12-31 19:00:03 -0500" do
      expect(3.time.to_s).to eq("1969-12-31 19:00:03 -0500")
    end
  end

end