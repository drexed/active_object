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

  describe '#difference' do
    it 'to be 0' do
      expect([].difference).to eq(0)
    end

    it 'to be nil' do
      expect([].difference(nil)).to eq(nil)
    end

    it 'to be -4' do
      expect([1, 2, 3].difference).to eq(-4)
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

  describe '#frequencies' do
    it 'to be {}' do
      expect([].frequencies).to eq({})
    end

    it 'to be { 1 => 2, :symbol => 2, "string" => 1, 3 => 1 }' do
      expect([1, :symbol, 'string', 3, :symbol, 1].frequencies).to eq({ 1 => 2, :symbol => 2, 'string' => 1, 3 => 1 })
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

  describe '#max' do
    it 'to be 0' do
      expect([].max).to eq(0)
    end

    it 'to be nil' do
      expect([].max(nil)).to eq(nil)
    end

    it 'to be 3' do
      expect([2, 3, 1].max).to eq(3)
    end
  end

  describe '#min' do
    it 'to be 0' do
      expect([].min).to eq(0)
    end

    it 'to be nil' do
      expect([].min(nil)).to eq(nil)
    end

    it 'to be 3' do
      expect([2, 3, 1].min).to eq(1)
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

end
