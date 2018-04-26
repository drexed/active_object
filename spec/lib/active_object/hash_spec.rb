# frozen_string_literal: true

require 'spec_helper'

describe ActiveObject::Hash do

  describe '#assert_valid_keys' do
    it 'to be {}' do
      expect({}.assert_valid_keys(:foo)).to eq({})
    end

    it 'to be { foo: "bar" }' do
      expect({ foo: 'bar' }.assert_valid_keys(:foo)).to eq({ foo: 'bar' })
    end

    it 'to raise error' do
      expect { { foo: 'bar', baz: 'boz' }.assert_valid_keys(:foo) }.to raise_error(ArgumentError)
    end
  end

  describe '#assert_valid_keys!' do
    it 'to be {}' do
      expect { {}.assert_valid_keys!(:foo) }.to raise_error(ArgumentError)
    end

    it 'to be { foo: "bar" }' do
      expect({ foo: 'bar' }.assert_valid_keys!(:foo)).to eq({ foo: 'bar' })
    end

    it 'to raise error' do
      expect { { foo: 'bar', baz: 'boz' }.assert_valid_keys!(:foo) }.to raise_error(ArgumentError)
    end
  end

  describe '#collect_keys' do
    it 'to be ["FOO", "BAZ"]' do
      expect({ foo: 'bar', baz: 'boo' }.collect_keys { |k| k.to_s.upcase }).to eq(['FOO', 'BAZ'])
    end
  end

  describe '#collect_values' do
    it 'to be ["BAR", "BOO"]' do
      expect({ foo: 'bar', baz: 'boo' }.collect_values { |k| k.to_s.upcase }).to eq(['BAR', 'BOO'])
    end
  end

  describe '#compact(!)' do
    it 'to be nil' do
      expect({}.compact!).to eq(nil)
    end

    it 'to be {}' do
      expect({}.compact).to eq({})
      expect({ foo: nil }.compact).to eq({})
      expect({ foo: nil }.compact!).to eq({})
    end

    it 'to be { foo: "bar", baz: false, boo: nil }' do
      expect({ foo: 'bar', baz: false, boo: nil }.compact).to eq({ foo: 'bar', baz: false })
      expect({ foo: 'bar', baz: false, boo: nil }.compact!).to eq({ foo: 'bar', baz: false })
    end
  end

  describe '#deep_dup(!)' do
    it 'to be { a: false, b: { c: [1, 2, 3], x: [3, 4, 5] } }' do
      h1 = { a: true, b: { c: [1, 2, 3] } }
      h2 = { a: false, b: { x: [3, 4, 5] } }

      expect(h1.deep_merge(h2)).to eq({ a: false, b: { c: [1, 2, 3], x: [3, 4, 5] } })
      expect(h1.deep_merge!(h2)).to eq({ a: false, b: { c: [1, 2, 3], x: [3, 4, 5] } })
    end
  end

  describe '#demote(!)' do
    h1 = { a: 0, b: 1, c: 2 }

    it 'to be { a: 0, c: 2, b: 1 }' do
      expect(h1.demote(:b)).to eq({ a: 0, c: 2, b: 1 })
    end

    it 'to be { a: 0, b: 1, c: 2 }' do
      expect(h1.demote!(:d)).to eq(h1)
    end
  end

  describe '#denillify(!)' do
    it 'to be { abc: 0, xyz: 1 }' do
      h1 = { abc: nil, xyz: 1 }
      h2 = { abc: 0, xyz: 1 }

      expect(h1.denillify).to eq(h2)
      expect(h1.denillify!).to eq(h2)
    end

    it 'to be { abc: 9, xyz: 1 }' do
      h1 = { abc: nil, xyz: 1 }
      h2 = { abc: 9, xyz: 1 }

      expect(h1.denillify(9)).to eq(h2)
      expect(h1.denillify!(9)).to eq(h2)
    end
  end

  describe '#dig' do
    h1 = { a: { b: { c: :d } } }

    it 'to be { c: :d }' do
      expect(h1.dig(:a, :b)).to eq({ c: :d })
    end

    it 'to be :d' do
      expect(h1.dig(:a, :b, :c)).to eq(:d)
    end
  end

  describe '#except(!)' do
    it 'to be {}' do
      expect({}.except(:foo)).to eq({})
      expect({}.except!(:foo)).to eq({})
    end

    it 'to be { :foo => 1 }' do
      expect({ foo: 1, baz: 2, bar: 3 }.except(:baz, :bar)).to eq({ foo: 1 })
      expect({ foo: 1, baz: 2, bar: 3 }.except!(:baz, :bar)).to eq({ foo: 1 })
      expect({ :foo => 1, :baz => 2, :bar => 3 }.except(:baz, :bar)).to eq({ :foo => 1 })
      unless defined?(ActiveSupport)
        expect({ :foo => 1, :baz => 2, :bar => 3 }.except([:baz, :bar])).to eq({ :foo => 1 })
      end
      expect({ :foo => 1, :baz => 2, :bar => 3 }.except!(:baz, :bar)).to eq({ :foo => 1 })
    end

    it 'to be { :baz => 2, :bar => 3 }' do
      expect({ foo: 1, baz: 2, bar: 3 }.except(:foo)).to eq({ baz: 2, bar: 3 })
      expect({ foo: 1, baz: 2, bar: 3 }.except!(:foo)).to eq({ baz: 2, bar: 3 })
      expect({ :foo => 1, :baz => 2, :bar => 3 }.except(:foo)).to eq({ :baz => 2, :bar => 3 })
      expect({ :foo => 1, :baz => 2, :bar => 3 }.except!(:foo)).to eq({ :baz => 2, :bar => 3 })
    end
  end

  describe '#hmap!' do
    it 'to be { a: 4, b: 5, c: 6 }' do
      expect({ a: 1, b: 2, c: 3 }.hmap { |k, v| { k => v + 3 } }).to eq({ a: 4, b: 5, c: 6 })
      expect({ a: 1, b: 2, c: 3 }.hmap! { |k, v| { k => v + 3 } }).to eq({ a: 4, b: 5, c: 6 })
    end
  end

  describe '#nillify' do
    it 'to be {a: 1, b: "test", c: nil, d: nil, e: nil, f: nil}' do
      hsh = { a: 1, b: 'test', c: nil, d: false, e: '', f: ' ' }

      expect(hsh.nillify).to eq({ a: 1, b: 'test', c: nil, d: nil, e: nil, f: nil })
      expect(hsh.nillify!).to eq({ a: 1, b: 'test', c: nil, d: nil, e: nil, f: nil })
    end
  end

  describe '#only(!)' do
    it 'to be {}' do
      expect({}.only(:foo)).to eq({})
      expect({}.only!(:foo)).to eq({})
    end

    it 'to be { :foo => 1 }' do
      expect({ foo: 1, baz: 2, bar: 3 }.only(:foo)).to eq({ foo: 1 })
      expect({ foo: 1, baz: 2, bar: 3 }.only!(:foo)).to eq({ foo: 1 })
      expect({ :foo => 1, :baz => 2, :bar => 3 }.only(:foo)).to eq({ :foo => 1 })
      expect({ :foo => 1, :baz => 2, :bar => 3 }.only!(:foo)).to eq({ :foo => 1 })
    end

    it 'to be { :baz => 2, :bar => 3 }' do
      expect({ foo: 1, baz: 2, bar: 3 }.only(:baz, :bar)).to eq({ baz: 2, bar: 3 })
      expect({ foo: 1, baz: 2, bar: 3 }.only([:baz, :bar])).to eq({ baz: 2, bar: 3 })
      expect({ foo: 1, baz: 2, bar: 3 }.only!(:baz, :bar)).to eq({ baz: 2, bar: 3 })
      expect({ :foo => 1, :baz => 2, :bar => 3 }.only(:baz, :bar)).to eq({ :baz => 2, :bar => 3 })
      expect({ :foo => 1, :baz => 2, :bar => 3 }.only!(:baz, :bar)).to eq({ :baz => 2, :bar => 3 })
    end
  end

  describe '#promote(!)' do
    h1 = { a: 0, b: 1, c: 2 }

    it 'to be { b: 1, a: 0, c: 2 }' do
      expect(h1.promote(:b)).to eq({ b: 1, a: 0, c: 2 })
    end

    it 'to be { a: 0, b: 1, c: 2 }' do
      expect(h1.promote!(:d)).to eq(h1)
    end
  end

  describe '#rename_keys(!)' do
    it 'to be [:baz, :bar]' do
      expect({ foo: 'foo', baz: 'baz' }.rename_keys(foo: :bar).keys).to eq([:baz, :bar])
      expect({ foo: 'foo', baz: 'baz' }.rename_keys!(foo: :bar).keys).to eq([:baz, :bar])
    end

    it 'to be [:foo, "tick"]' do
      expect({ foo: 'foo', 'baz' => 'baz' }.rename_keys('baz' => 'tick').keys).to eq([:foo, 'tick'])
      expect({ foo: 'foo', 'baz' => 'baz' }.rename_keys!('baz' => 'tick').keys).to eq([:foo, 'tick'])
    end

    it 'to be [:bar, :tick]' do
      expect({ foo: 'foo', baz: 'baz' }.rename_keys(foo: :bar, baz: :tick).keys).to eq([:bar, :tick])
      expect({ foo: 'foo', baz: 'baz' }.rename_keys!(foo: :bar, baz: :tick).keys).to eq([:bar, :tick])
    end

    it 'to be [:bar, "tick"]' do
      expect({ foo: 'foo', 'baz' => 'baz' }.rename_keys(foo: :bar, 'baz' => 'tick').keys).to eq([:bar, 'tick'])
      expect({ foo: 'foo', 'baz' => 'baz' }.rename_keys!(foo: :bar, 'baz' => 'tick').keys).to eq([:bar, 'tick'])
    end
  end

  describe '#reverse_merge(!)' do
    it 'to be { foo: "bar" }' do
      expect({}.reverse_merge(foo: 'bar')).to eq({ foo: 'bar' })
      expect({}.reverse_merge!(foo: 'bar')).to eq({ foo: 'bar' })
    end

    it 'to be { foo: "bar", baz: "boo", boo: "bam" }' do
      expect({ foo: 'bar' }.reverse_merge(baz: 'boo', boo: 'bam')).to eq({ foo: 'bar', baz: 'boo', boo: 'bam' })
      expect({ foo: 'bar' }.reverse_merge!(baz: 'boo', boo: 'bam')).to eq({ foo: 'bar', baz: 'boo', boo: 'bam' })
    end
  end

  describe '#sample(!)' do
    it 'to be true' do
      shash = { a: 1, b: 2, c: 3, d: 4, e: 5 }

      expect(shash.keys.include?(shash.sample.first)).to eq(true)
    end

    it 'to be true' do
      shash = { a: 1, b: 2, c: 3, d: 4, e: 5 }

      expect(shash.keys.include?(shash.sample!.first)).to eq(true)
    end
  end

  describe '#sample_key(!)' do
    it 'to be true' do
      shash = { a: 1, b: 2, c: 3, d: 4, e: 5 }

      expect(shash.keys.include?(shash.sample_key)).to eq(true)
    end

    it 'to be true' do
      shash = { a: 1, b: 2, c: 3, d: 4, e: 5 }

      expect(shash.keys.include?(shash.sample_key!)).to eq(true)
    end
  end

  describe '#sample_value(!)' do
    it 'to be true' do
      shash = { a: 1, b: 2, c: 3, d: 4, e: 5 }

      expect(shash.values.include?(shash.sample_value)).to eq(true)
    end

    it 'to be true' do
      shash = { a: 1, b: 2, c: 3, d: 4, e: 5 }

      expect(shash.values.include?(shash.sample_value!)).to eq(true)
    end
  end

  describe '#shuffle(!)' do
    it 'to not be { a: 1, b: 2, c: 3, d: 4, e: 5 }' do
      shash = { a: 1, b: 2, c: 3, d: 4, e: 5 }

      expect(shash.keys).not_to eq(shash.shuffle.keys)
    end

    it 'to be { a: 1, b: 2, c: 3, d: 4, e: 5 }' do
      shash = { a: 1, b: 2, c: 3, d: 4, e: 5 }

      expect(shash.keys).not_to eq(shash.shuffle!.keys)
    end
  end

  describe '#slice(!)' do
    it 'to be { a: 1, b: 2 }' do
      expect({ a: 1, b: 2, c: 3, d: 4 }.slice(:a, :b)).to eq({ a: 1, b: 2 })
    end

    it 'to be { a: 3, b: 4 }' do
      expect({ a: 1, b: 2, c: 3, d: 4 }.slice!(:a, :b)).to eq({ c: 3, d: 4 })
    end
  end

  describe '#stringify_keys(!)' do
    it 'to be { "foo" => "foo", "bar" => "bar" }' do
      expect({ foo: 'foo', 'bar' => 'bar' }.stringify_keys).to eq({ 'foo' => 'foo', 'bar' => 'bar' })
      expect({ foo: 'foo', 'bar' => 'bar' }.stringify_keys!).to eq({ 'foo' => 'foo', 'bar' => 'bar' })
    end
  end

  describe '#strip(!)' do
    it 'to be nil' do
      expect({}.strip!).to eq(nil)
    end

    it 'to be {}' do
      expect({}.strip).to eq({})
      expect({ foo: nil, baz: false, boo: '', faz: ' ' }.strip).to eq({})
      expect({ foo: nil, baz: false, boo: '', faz: ' ' }.strip!).to eq({})
    end

    it 'to be { foo: "bar", baz: false, boo: nil }' do
      expect({ foo: 'bar', baz: false, boo: nil, boz: '', faz: ' ' }.strip).to eq({ foo: 'bar' })
      expect({ foo: 'bar', baz: false, boo: nil, boz: '', faz: ' ' }.strip!).to eq({ foo: 'bar' })
    end
  end

  describe '#symbolize_keys(!)' do
    it 'to be { foo: "foo", bar: "bar" }' do
      expect({ foo: 'foo', 'bar' => 'bar' }.symbolize_keys).to eq({ foo: 'foo', bar: 'bar' })
      expect({ foo: 'foo', 'bar' => 'bar' }.symbolize_keys!).to eq({ foo: 'foo', bar: 'bar' })
    end
  end

  describe '#symbolize_and_underscore_keys(!)' do
    it 'to be { foo_bar: "example", baz_bar: "string" }' do
      hsh = { 'foo Bar' => 'example', bazBar: 'string' }

      expect(hsh.symbolize_and_underscore_keys).to eq({ foo_bar: 'example', baz_bar: 'string' })
      expect(hsh.symbolize_and_underscore_keys!).to eq({ foo_bar: 'example', baz_bar: 'string' })
    end
  end

  describe '#transform_keys(!)' do
    it 'to be { "FOO" => "foo", "BAZ" => "bar" }' do
      expect({ foo: 'bar', baz: 'boo' }.transform_keys { |k| k.to_s.upcase }).to eq({ 'FOO' => 'bar', 'BAZ' => 'boo' })
      expect({ foo: 'bar', baz: 'boo' }.transform_keys! { |k| k.to_s.upcase }).to eq({ 'FOO' => 'bar', 'BAZ' => 'boo' })
    end
  end

  describe '#transform_values(!)' do
    it 'to be { foo: "BAR", baz: "BOO" }' do
      expect({ foo: 'bar', baz: 'boo' }.transform_values { |v| v.to_s.upcase }).to eq({ foo: 'BAR', baz: 'BOO' })
      expect({ foo: 'bar', baz: 'boo' }.transform_values! { |v| v.to_s.upcase }).to eq({ foo: 'BAR', baz: 'BOO' })
    end
  end

end
