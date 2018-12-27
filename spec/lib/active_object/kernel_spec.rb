# frozen_string_literal: true

require 'spec_helper'

class Foo
  def level_1
    caller_name
  end

  def level_2
    level_1
  end

  def level_3
    level_4
  end

  def level_4
    caller_name(1)
  end
end

describe Kernel do
  let(:klass) { Foo.new }

  describe '#safe_eval' do
    it 'to be [1,2,3]' do
      expect('[1,2,3]'.safe_eval).to eq([1,2,3])
    end

    it 'to be "[#1,2,3]"' do
      expect('[#1,2,3]'.safe_eval).to eq('[#1,2,3]')
    end

    it 'to be nil' do
      expect(nil.safe_eval).to eq(nil)
    end
  end

  describe '#try_eval' do
    it 'to be [1,2,3]' do
      expect('[1,2,3]'.try_eval).to eq([1,2,3])
    end

    it 'to be nil for "[#1,2,3]"' do
      expect('[#1,2,3]'.try_eval).to eq(nil)
    end

    it 'to be nil for nil' do
      expect(nil.try_eval).to eq(nil)
    end
  end

  describe '#caller_name' do
    it 'to be "level_1"' do
      expect(klass.level_1).to eq('level_1')
      expect(klass.level_2).to eq('level_1')
    end

    it 'to be "level_3"' do
      expect(klass.level_3).to eq('level_3')
    end

    it 'to be "level_4"' do
      expect(klass.level_4).to eq('level_4')
    end
  end

end
