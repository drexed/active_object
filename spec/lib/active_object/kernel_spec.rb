# frozen_string_literal: true

require 'spec_helper'

describe Kernel do
  let(:klass) do
    class Foo
      def test_method
        caller_name
      end
    end

    Foo.new
  end

  describe '#try_eval' do
    it 'to be [1,2,3]' do
      expect('[1,2,3]'.try_eval).to eq([1,2,3])
    end

    it 'to be "[/1,2,3]"' do
      expect('[/1,2,3]'.try_eval).to eq('[/1,2,3]')
    end
  end

  describe '#caller_name' do
    it 'to be "test_method"' do
      expect(klass.test_method).to eq('test_method')
    end
  end

end
