require "spec_helper"

describe ActiveObject::Object do

  describe "#array?" do
    it "to be true" do
      expect([].array?).to eq(true)
    end

    it "to be false" do
      expect(1.array?).to eq(false)
      expect("".array?).to eq(false)
    end
  end

  describe "#blank?" do
    it "to be true" do
      expect("".blank?).to eq(true)
      expect(" ".blank?).to eq(true)
      expect([].blank?).to eq(true)
      expect({}.blank?).to eq(true)
      expect(false.blank?).to eq(true)
    end

    it "to be false" do
      expect("x".blank?).to eq(false)
      expect("foo bar".blank?).to eq(false)
      expect("19".blank?).to eq(false)
      expect(true.blank?).to eq(false)
    end
  end

  describe "#boolean?" do
    it "to be true" do
      expect(false.boolean?).to eq(true)
      expect(true.boolean?).to eq(true)
      expect(nil.boolean?).to eq(true)
      expect(0.boolean?).to eq(true)
      expect(1.boolean?).to eq(true)
    end

    it "to be false" do
      expect("true".array?).to eq(false)
    end
  end

  describe "#false?" do
    it "to be true" do
      expect(false.false?).to eq(true)
    end

    it "to be false" do
      expect(true.false?).to eq(false)
    end
  end

  describe "#falsey?" do
    it "to be true" do
      expect(false.falsey?).to eq(true)
      expect(nil.falsey?).to eq(true)
      expect(0.falsey?).to eq(true)
    end

    it "to be false" do
      expect(true.false?).to eq(false)
      expect(1.false?).to eq(false)
    end
  end

  describe "#float?" do
    it "to be true" do
      expect(1.0.float?).to eq(true)
      expect(-1.0.float?).to eq(true)
    end

    it "to be false" do
      expect("1".float?).to eq(false)
      expect(1.float?).to eq(false)
      expect(-1.float?).to eq(false)
    end
  end

  describe "#hash?" do
    it "to be true" do
      expect({}.hash?).to eq(true)
    end

    it "to be false" do
      expect(1.hash?).to eq(false)
      expect("".hash?).to eq(false)
    end
  end

  describe "#integer?" do
    it "to be true" do
      expect(1.integer?).to eq(true)
      expect(-1.integer?).to eq(true)
    end

    it "to be false" do
      expect("1".integer?).to eq(false)
      expect(1.0.integer?).to eq(false)
      expect(-1.0.integer?).to eq(false)
    end
  end

  describe "#numeric?" do
    it "to be true" do
      expect(1.numeric?).to eq(true)
      expect(-1.numeric?).to eq(true)
      expect(1.0.numeric?).to eq(true)
    end

    it "to be false" do
      expect("1".numeric?).to eq(false)
      expect([].integer?).to eq(false)
      expect({}.integer?).to eq(false)
    end
  end

  describe "#numeral?" do
    it "to be true" do
      expect(5.numeral?).to eq(true)
      expect(0.numeral?).to eq(true)
      expect(-37.3.numeral?).to eq(true)
      expect(51.45.numeral?).to eq(true)
      expect("+256.375".numeral?).to eq(true)
      expect("-37.3".numeral?).to eq(true)
    end

    it "to be false" do
      expect("".numeral?).to eq(false)
      expect(" ".numeral?).to eq(false)
      expect("2.3.3".numeral?).to eq(false)
      expect("$9.86".numeral?).to eq(false)
      expect("x".numeral?).to eq(false)
      expect("foo".numeral?).to eq(false)
    end
  end

  describe "#palindrome?" do
    it "to be true" do
      expect("racecar".palindrome?).to eq(true)
      expect(12321.palindrome?).to eq(true)
    end

    it "to be false" do
      expect("example".palindrome?).to eq(false)
      expect(12345.palindrome?).to eq(false)
    end
  end

  describe "#present?" do
    it "to be true" do
      expect("x".present?).to eq(true)
      expect("foo bar".present?).to eq(true)
      expect("19".present?).to eq(true)
      expect(true.present?).to eq(true)
    end

    it "to be false" do
      expect("".present?).to eq(false)
      expect([].present?).to eq(false)
      expect({}.present?).to eq(false)
      expect(false.present?).to eq(false)
    end
  end

  describe "#range?" do
    it "to be true" do
      expect((1..2).range?).to eq(true)
    end

    it "to be false" do
      expect(1.range?).to eq(false)
    end
  end

  describe "#salvage" do
    it "to be '---'" do
      expect(false.salvage).to eq("---")
      expect("".salvage).to eq("---")
      expect(" ".salvage).to eq("---")
      expect(nil.salvage).to eq("---")
    end

    it "to be 'bar'" do
      expect(" ".salvage("bar")).to eq("bar")
    end

    it "to be 'foo'" do
      expect("foo".salvage).to eq("foo")
    end

    it "to be 12" do
      expect(12.salvage).to eq(12)
    end
  end

  describe "#string?" do
    it "to be true" do
      expect("foo".string?).to eq(true)
    end

    it "to be false" do
      expect(1.string?).to eq(false)
      expect([].string?).to eq(false)
    end
  end

  describe "#time?" do
    it "to be true" do
      expect(Time.now.time?).to eq(true)
    end

    it "to be false" do
      expect(1.time?).to eq(false)
      expect([].time?).to eq(false)
    end
  end

  describe "#true?" do
    it "to be true" do
      expect(true.true?).to eq(true)
    end

    it "to be false" do
      expect(false.true?).to eq(false)
    end
  end

  describe "#truthy?" do
    it "to be true" do
      expect(true.truthy?).to eq(true)
      expect(1.truthy?).to eq(true)
    end

    it "to be false" do
      expect(false.truthy?).to eq(false)
      expect(nil.truthy?).to eq(false)
      expect(0.truthy?).to eq(false)
    end
  end

  describe "#try(!)" do
    it "to be nil" do
      expect("example".try(:fake_method)).to eq(nil)
    end

    it "to be upcase" do
      expect("example".try(:upcase)).to eq("EXAMPLE")
      expect("example".try!(:upcase)).to eq("EXAMPLE")
    end

    it "to raise error" do
      expect { "example".try!(:fake_method) }.to raise_error(NoMethodError)
    end
  end

end
