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

  describe '#caller_name' do
    it 'to be "test_method"' do
      expect(klass.test_method).to eq('test_method')
    end
  end

end
