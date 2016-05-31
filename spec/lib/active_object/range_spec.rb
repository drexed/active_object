require 'spec_helper'

describe Range do

  describe "#combine" do
    it "to be [1, 2, 3, 4, 5, 6]" do
      expect((1..3).combine(4..6)).to eq([1, 2, 3, 4, 5, 6])
    end
  end

  describe "#include_with_range?" do
    it "to be true" do
      expect((1..5).include_with_range?(1..5)).to eq(true)
      expect((1..5).include_with_range?(2..3)).to eq(true)
    end

    it "to be false" do
      expect((1..5).include_with_range?(2..6)).to eq(false)
    end
  end

  describe "#overlaps?" do
    it "to be true" do
      expect((1..5).overlaps?(4..6)).to eq(true)
    end

    it "to be false" do
      expect((1..5).overlaps?(7..9)).to eq(false)
    end
  end

  describe "#sample" do
    it "to be true" do
      expect([1, 2, 3, 4, 5].include?((1..5).sample)).to eq(true)
    end

    it "to be false" do
      expect([1, 2, 3, 4, 5].include?((6..9).sample)).to eq(false)
    end
  end

  describe "#shuffle" do
    it "to not be [1, 2, 3, 4, 5]" do
      expect((1..5).shuffle).not_to eq([1, 2, 3, 4, 5])
    end
  end

  describe "#within?" do
    it "to be true" do
      expect((1..5).within?(2..4)).to eq(true)
      expect((1..5).within?(2..5)).to eq(true)
    end

    it "to be false" do
      expect((1..5).within?(2..6)).to eq(false)
      expect((1..5).within?(0..6)).to eq(false)
    end
  end

end