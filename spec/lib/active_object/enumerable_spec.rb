# frozen_string_literal: true

require 'spec_helper'

describe Enumerable do

  describe '#average' do
    it 'to be 0' do
      expect([].average).to eq(0)
    end

    it 'to be nil' do
      expect([].average(nil)).to eq(nil)
    end

    it 'to be 2' do
      expect([1, 2, 3].average).to eq(2)
    end

    it 'to be 2.5' do
      expect([1, 2, 3, 4].average).to eq(2.5)
    end
  end

  describe '#cluster' do
    it 'to be [[2, 2, 2], [3, 3], [4], [2, 2], [1]]' do
      expect([2, 2, 2, 3, 3, 4, 2, 2, 1].cluster { |x| x }).to eq([[2, 2, 2], [3, 3], [4], [2, 2], [1]])
    end
  end

  describe '#critical_zscore' do
    it 'to be nil' do
      expect([].critical_zscore).to eq(nil)
    end

    it 'to be 0' do
      expect([].critical_zscore(0)).to eq(0)
    end

    it 'to be 2.29' do
      expect([1, 2, 3, 4, 5, 6, 7, 8, 9, 10].critical_zscore).to eq(2.29)
    end
  end

  describe '#defference' do
    it 'to be 0' do
      expect([].defference).to eq(0)
    end

    it 'to be nil' do
      expect([].defference(nil)).to eq(nil)
    end

    it 'to be -4' do
      expect([1, 2, 3].defference).to eq(-4)
    end
  end

  describe '#divisible' do
    it 'to be 0' do
      expect([].divisible).to eq(0)
    end

    it 'to be nil' do
      expect([].divisible(nil)).to eq(nil)
    end

    it 'to be 2' do
      expect([16, 4, 2].divisible).to eq(2)
    end
  end

  describe '#drop_last' do
    it 'to be []' do
      expect([].drop_last(1)).to eq([])
    end

    it 'to be [1, 2]' do
      expect([1, 2, 3].drop_last(1)).to eq([1, 2])
    end

    it 'to be [1]' do
      expect([1, 2, 3].drop_last(2)).to eq([1])
    end
  end

  describe '#drop_last_if' do
    it 'to be []' do
      expect([].take_last_if(&:odd?)).to eq([])
    end

    it 'to be [1, 2]' do
      expect([1, 2, 3].drop_last_if(&:odd?)).to eq([1, 2])
    end

    it 'to be [1, 2, 3, 4]' do
      expect([1, 2, 3, 4].drop_last_if(&:odd?)).to eq([1, 2, 3, 4])
    end
  end

  describe '#exactly?' do
    it 'to be true' do
      expect([1, false, nil].exactly?(1)).to eq(true)
      expect([false, nil].exactly?(0)).to eq(true)
      expect([1, 2, 3].exactly?(3)).to eq(true)
      expect([1, 2, 3, 4].exactly?(1) { |n| n > 3 }).to eq(true)
      expect([1, 2, 3, 4].exactly?(2, &:even?)).to eq(true)
    end

    it 'to be false' do
      expect([].exactly?(1)).to eq(false)
      expect([1, false, nil].exactly?(3)).to eq(false)
      expect([1, 1, 3, 3].exactly?(2, &:even?)).to eq(false)
    end
  end

  describe '#exclude?' do
    it 'to be true' do
      expect([1, 2, 3].exclude?(4)).to eq(true)
    end

    it 'to be false' do
      expect([1, 2, 3].exclude?(3)).to eq(false)
    end
  end

  describe '#expand' do
    it 'to be [0, [2, 3], [5, 6, 7]]' do
      expect([0, 2..3, 5..7].expand).to eq([0, [2, 3], [5, 6, 7]])
    end
  end

  describe '#exponential' do
    it 'to be 0' do
      expect([].exponential).to eq(0)
    end

    it 'to be nil' do
      expect([].exponential(nil)).to eq(nil)
    end

    it 'to be 4096' do
      expect([2, 3, 4].exponential).to eq(4096)
    end
  end

  describe '#incase?' do
    it 'to be true' do
      expect([1, 2, 'a'].incase?(2)).to eq(true)
      expect([1, 2, 'a'].incase?(String)).to eq(true)
    end

    it 'to be false' do
      expect([1, 2, 'a'].incase?(3)).to eq(false)
    end
  end

  describe '#interpose' do
    it 'to be [1, :sep, 2, :sep, "a"]' do
      expect([1, 2, 'a'].interpose(:sep).to_a).to eq([1, :sep, 2, :sep, 'a'])
    end
  end

  describe '#many?' do
    it 'to be true' do
      expect([1, 2, 3].many?).to eq(true)
      expect([1, false, nil].many?).to eq(true)
      expect([1, 2, 3, 4].many?(&:even?)).to eq(true)
    end

    it 'to be false' do
      expect([].many?).to eq(false)
      expect([1, 1, 3, 3].many?(&:even?)).to eq(false)
    end
  end

  describe '#mean' do
    it 'to be 0' do
      expect([].mean).to eq(0)
    end

    it 'to be nil' do
      expect([].mean(nil)).to eq(nil)
    end

    it 'to be 2' do
      expect([1, 2, 3].mean).to eq(2)
    end

    it 'to be 2.5' do
      expect([1, 2, 3, 4].mean).to eq(2.5)
    end
  end

  describe '#median' do
    it 'to be 0' do
      expect([].median).to eq(0)
    end

    it 'to be nil' do
      expect([].median(nil)).to eq(nil)
    end

    it 'to be 2' do
      expect([1, 2, 6].median).to eq(2)
    end

    it 'to be 2.5' do
      expect([1, 2, 3, 6].median).to eq(2.5)
    end
  end

  describe '#mode' do
    it 'to be 0' do
      expect([].mode).to eq(0)
    end

    it 'to be nil' do
      expect([].mode(nil)).to eq(nil)
      expect([1, 2, 3].mode).to eq(nil)
    end

    it 'to be 1' do
      expect([1, 1, 2, 46].mode).to eq(1)
    end

    it 'to be 3.5' do
      expect([3.5].mode).to eq(3.5)
    end
  end

  describe '#multiple' do
    it 'to be 0' do
      expect([].multiple).to eq(0)
    end

    it 'to be nil' do
      expect([].multiple(nil)).to eq(nil)
    end

    it 'to be 6' do
      expect([1, 2, 3].multiple).to eq(6)
    end
  end

  describe '#occurrences' do
    it 'to be {}' do
      expect([].occurrences).to eq({})
    end

    it 'to be { 1 => 2, :symbol => 2, "string" => 1, 3 => 1 }' do
      expect([1, :symbol, 'string', 3, :symbol, 1].occurrences).to eq({ 1 => 2, :symbol => 2, 'string' => 1, 3 => 1 })
    end
  end

  describe '#percentile' do
    it 'to be 0' do
      expect([].percentile(50)).to eq(0)
    end

    it 'to be nil' do
      expect([].percentile(50, nil)).to eq(nil)
    end

    it 'to be 1' do
      expect([0, 1, 0].percentile(95)).to eq(1)
    end

    it 'to be 2' do
      expect([1, 2, 3, 4].percentile(50)).to eq(2)
    end

    it 'to be 3' do
      expect([1, 2, 3, 4, 5].percentile(50)).to eq(3)
    end
  end

  describe '#range' do
    it 'to be 0' do
      expect([].range).to eq(0)
    end

    it 'to be nil' do
      expect([].range(nil)).to eq(nil)
    end

    it 'to be 5' do
      expect([1, 2, 6].range).to eq(5)
    end
  end

  describe '#reject_outliers(!)' do
    it 'to be [1, 2, 3, 4, 5, 6, 7, 8, 9]' do
      expect([1, 2, 3, 4, 5, 6, 7, 8, 9, 30].reject_outliers).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
      expect([1, 2, 3, 4, 5, 6, 7, 8, 9, 30].reject_outliers!).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe '#select_outliers(!)' do
    it 'to be [30]' do
      expect([1, 2, 3, 4, 5, 6, 7, 8, 9, 30].select_outliers).to eq([30])
    end
  end

  describe '#several?' do
    it 'to be true' do
      expect([1, 2, 3].several?).to eq(true)
      expect([1, 2, 3, 4].several?(&:even?)).to eq(true)
    end

    it 'to be false' do
      expect([].several?).to eq(false)
      expect([1, false, nil].several?).to eq(false)
      expect([1, 1, 3, 3].several?(&:even?)).to eq(false)
    end
  end

  describe '#standard_deviation' do
    it 'to be 0' do
      expect([].standard_deviation).to eq(0)
    end

    it 'to be nil' do
      expect([].standard_deviation(nil)).to eq(nil)
    end

    it 'to be 0' do
      expect([1].standard_deviation).to eq(0)
    end

    it 'to be 2.6457513110645907' do
      expect([1, 2, 6].standard_deviation).to eq(2.6457513110645907)
    end
  end

  describe '#sum' do
    it 'to be 0' do
      expect([].sum).to eq(0)
    end

    it 'to be 6' do
      expect([1, 2, 3].sum).to eq(6)
    end

    it 'to be "foobar"' do
      expect(%w(foo bar).sum).to eq('foobar')
    end
  end

  describe '#take_last' do
    it 'to be []' do
      expect([].take_last(3)).to eq([])
    end

    it 'to be [3]' do
      expect([1, 2, 3].take_last(1)).to eq([3])
    end

    it 'to be [2, 3]' do
      expect([1, 2, 3].take_last(2)).to eq([2, 3])
    end
  end

  describe '#take_last_if' do
    it 'to be []' do
      expect([].take_last_if(&:odd?)).to eq([])
    end

    it 'to be [3]' do
      expect([1, 2, 3].take_last_if(&:odd?)).to eq([3])
    end

    it 'to be [1, 2, 3, 4]' do
      expect([1, 2, 3, 4].take_last_if(&:odd?)).to eq([])
    end
  end

  describe '#variance' do
    it 'to be 0' do
      expect([].variance).to eq(0)
    end

    it 'to be nil' do
      expect([].variance(nil)).to eq(nil)
    end

    it 'to be 7' do
      expect([1, 2, 6].variance).to eq(7)
    end
  end

  describe '#zscore' do
    it 'to be 0.8257228238447705' do
      expect([1, 2, 3, 4, 5, 6, 7, 8, 9, 10].zscore(3)).to eq(0.8257228238447705)
    end

    it 'to be 0' do
      expect([].zscore(3)).to eq(0)
    end
  end

end
