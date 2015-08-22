require 'spec_helper'

describe Hash do

  describe "#assert_valid_keys" do
    it "to be {}" do
      expect({}.assert_valid_keys(:foo)).to eq({})
    end

    it "to be { foo: 'bar' }" do
      expect({ foo: "bar" }.assert_valid_keys(:foo)).to eq({ foo: "bar" })
    end

    it "to raise error" do
      expect { { foo: "bar", baz: "boz" }.assert_valid_keys(:foo) }.to raise_error(ArgumentError)
    end
  end

  describe "#compact(!)" do
    it "to be nil" do
      expect({}.compact!).to eq(nil)
    end

    it "to be {}" do
      expect({}.compact).to eq({})
      expect({ foo: nil }.compact).to eq({})
      expect({ foo: nil }.compact!).to eq({})
    end

    it "to be { foo: 'bar', baz: false, boo: nil }" do
      expect({ foo: "bar", baz: false, boo: nil }.compact).to eq({ foo: "bar", baz: false })
      expect({ foo: "bar", baz: false, boo: nil }.compact!).to eq({ foo: "bar", baz: false })
    end
  end

  describe "#deep_dup(!)" do
    it "to be { a: false, b: { c: [1, 2, 3], x: [3, 4, 5] } }" do
      h1 = { a: true, b: { c: [1, 2, 3] } }
      h2 = { a: false, b: { x: [3, 4, 5] } }

      expect(h1.deep_merge(h2)).to eq({ a: false, b: { c: [1, 2, 3], x: [3, 4, 5] } })
      expect(h1.deep_merge!(h2)).to eq({ a: false, b: { c: [1, 2, 3], x: [3, 4, 5] } })
    end
  end

  describe "#except(!)" do
    it "to be {}" do
      expect({}.except(:foo)).to eq({})
      expect({}.except!(:foo)).to eq({})
    end

    it "to be { :foo => 1 }" do
      expect({ foo: 1, baz: 2, bar: 3 }.except(:baz, :bar)).to eq({ foo: 1 })
      expect({ foo: 1, baz: 2, bar: 3 }.except!(:baz, :bar)).to eq({ foo: 1 })
      expect({ :foo => 1, :baz => 2, :bar => 3 }.except(:baz, :bar)).to eq({ :foo => 1 })
      expect({ :foo => 1, :baz => 2, :bar => 3 }.except!(:baz, :bar)).to eq({ :foo => 1 })
    end

    it "to be { :baz => 2, :bar => 3 }" do
      expect({ foo: 1, baz: 2, bar: 3 }.except(:foo)).to eq({ baz: 2, bar: 3 })
      expect({ foo: 1, baz: 2, bar: 3 }.except!(:foo)).to eq({ baz: 2, bar: 3 })
      expect({ :foo => 1, :baz => 2, :bar => 3 }.except(:foo)).to eq({ :baz => 2, :bar => 3 })
      expect({ :foo => 1, :baz => 2, :bar => 3 }.except!(:foo)).to eq({ :baz => 2, :bar => 3 })
    end
  end

  describe "#nillify" do
    it "to be {a: 1, b: 'test', c: nil, d: nil, e: nil, f: nil}" do
      expect({ a: 1, b: "test", c: nil, d: false, e: "", f: " " }.nillify).to eq({a: 1, b: 'test', c: nil, d: nil, e: nil, f: nil})
      expect({ a: 1, b: "test", c: nil, d: false, e: "", f: " " }.nillify!).to eq({a: 1, b: 'test', c: nil, d: nil, e: nil, f: nil})
    end
  end

  describe "#only(!)" do
    it "to be {}" do
      expect({}.only(:foo)).to eq({})
      expect({}.only!(:foo)).to eq({})
    end

    it "to be { :foo => 1 }" do
      expect({ foo: 1, baz: 2, bar: 3 }.only(:foo)).to eq({ foo: 1 })
      expect({ foo: 1, baz: 2, bar: 3 }.only!(:foo)).to eq({ foo: 1 })
      expect({ :foo => 1, :baz => 2, :bar => 3 }.only(:foo)).to eq({ :foo => 1 })
      expect({ :foo => 1, :baz => 2, :bar => 3 }.only!(:foo)).to eq({ :foo => 1 })
    end

    it "to be { :baz => 2, :bar => 3 }" do
      expect({ foo: 1, baz: 2, bar: 3 }.only(:baz, :bar)).to eq({ baz: 2, bar: 3 })
      expect({ foo: 1, baz: 2, bar: 3 }.only!(:baz, :bar)).to eq({ baz: 2, bar: 3 })
      expect({ :foo => 1, :baz => 2, :bar => 3 }.only(:baz, :bar)).to eq({ :baz => 2, :bar => 3 })
      expect({ :foo => 1, :baz => 2, :bar => 3 }.only!(:baz, :bar)).to eq({ :baz => 2, :bar => 3 })
    end
  end

  describe "#rename_keys(!)" do
    it "to be [:baz, :bar]" do
      expect({ foo: 'foo', baz: 'baz' }.rename_keys(foo: :bar).keys).to eq([:baz, :bar])
      expect({ foo: 'foo', baz: 'baz' }.rename_keys!(foo: :bar).keys).to eq([:baz, :bar])
    end

    it "to be [:foo, 'tick']" do
      expect({ foo: 'foo', 'baz' => 'baz' }.rename_keys('baz' => 'tick').keys).to eq([:foo, 'tick'])
      expect({ foo: 'foo', 'baz' => 'baz' }.rename_keys!('baz' => 'tick').keys).to eq([:foo, 'tick'])
    end

    it "to be [:bar, :tick]" do
      expect({ foo: 'foo', baz: 'baz' }.rename_keys(foo: :bar, baz: :tick).keys).to eq([:bar, :tick])
      expect({ foo: 'foo', baz: 'baz' }.rename_keys!(foo: :bar, baz: :tick).keys).to eq([:bar, :tick])
    end

    it "to be [:bar, 'tick']" do
      expect({ foo: 'foo', 'baz' => 'baz' }.rename_keys(foo: :bar, 'baz' => 'tick').keys).to eq([:bar, 'tick'])
      expect({ foo: 'foo', 'baz' => 'baz' }.rename_keys!(foo: :bar, 'baz' => 'tick').keys).to eq([:bar, 'tick'])
    end
  end

  describe "#reverse_merge(!)" do
    it "to be { foo: 'bar' }" do
      expect({}.reverse_merge(foo: "bar")).to eq({ foo: "bar" })
      expect({}.reverse_merge!(foo: "bar")).to eq({ foo: "bar" })
    end

    it "to be { foo: 'bar', baz: 'boo', boo: 'bam' }" do
      expect({ foo: "bar" }.reverse_merge(baz: "boo", boo: "bam")).to eq({ foo: "bar", baz: "boo", boo: "bam" })
      expect({ foo: "bar" }.reverse_merge!(baz: "boo", boo: "bam")).to eq({ foo: "bar", baz: "boo", boo: "bam" })
    end
  end

  describe "#sample(!)" do
    it "to be true" do
      shash = { a: 1, b: 2, c: 3, d: 4, e: 5 }

      expect(shash.keys.include?(shash.sample.first)).to eq(true)
    end

    it "to be true" do
      shash = { a: 1, b: 2, c: 3, d: 4, e: 5 }

      expect(shash.keys.include?(shash.sample!.first)).to eq(true)
    end
  end

  describe "#sample_key(!)" do
    it "to be true" do
      shash = { a: 1, b: 2, c: 3, d: 4, e: 5 }

      expect(shash.keys.include?(shash.sample_key)).to eq(true)
    end

    it "to be true" do
      shash = { a: 1, b: 2, c: 3, d: 4, e: 5 }

      expect(shash.keys.include?(shash.sample_key!)).to eq(true)
    end
  end

  describe "#sample_value(!)" do
    it "to be true" do
      shash = { a: 1, b: 2, c: 3, d: 4, e: 5 }

      expect(shash.values.include?(shash.sample_value)).to eq(true)
    end

    it "to be true" do
      shash = { a: 1, b: 2, c: 3, d: 4, e: 5 }

      expect(shash.values.include?(shash.sample_value!)).to eq(true)
    end
  end

  describe "#shuffle(!)" do
    it "to not be { a: 1, b: 2, c: 3, d: 4, e: 5 }" do
      shash = { a: 1, b: 2, c: 3, d: 4, e: 5 }

      expect(shash.keys).not_to eq(shash.shuffle.keys)
    end

    it "to be { a: 1, b: 2, c: 3, d: 4, e: 5 }" do
      shash = { a: 1, b: 2, c: 3, d: 4, e: 5 }

      expect(shash.keys).not_to eq(shash.shuffle!.keys)
    end
  end

  describe "#slice(!)" do
    it "to be { a: 1, b: 2 }" do
      expect({ a: 1, b: 2, c: 3, d: 4 }.slice(:a, :b)).to eq({ a: 1, b: 2 })
    end

    it "to be { a: 3, b: 4 }" do
      expect({ a: 1, b: 2, c: 3, d: 4 }.slice!(:a, :b)).to eq({ c: 3, d: 4 })
    end
  end

  describe "#stringify_keys(!)" do
    it "to be { 'foo' => 'foo', 'bar' => 'bar' }" do
      expect({ foo: 'foo', 'bar' => 'bar' }.stringify_keys).to eq({ 'foo' => 'foo', 'bar' => 'bar' })
      expect({ foo: 'foo', 'bar' => 'bar' }.stringify_keys!).to eq({ 'foo' => 'foo', 'bar' => 'bar' })
    end
  end

  describe "#strip(!)" do
    it "to be nil" do
      expect({}.strip!).to eq(nil)
    end

    it "to be {}" do
      expect({}.strip).to eq({})
      expect({ foo: nil, baz: false, boo: '', faz: ' ' }.strip).to eq({})
      expect({ foo: nil, baz: false, boo: '', faz: ' ' }.strip!).to eq({})
    end

    it "to be { foo: 'bar', baz: false, boo: nil }" do
      expect({ foo: "bar", baz: false, boo: nil, boz: '', faz: ' ' }.strip).to eq({ foo: "bar" })
      expect({ foo: "bar", baz: false, boo: nil, boz: '', faz: ' ' }.strip!).to eq({ foo: "bar" })
    end
  end

  describe "#symbolize_keys(!)" do
    it "to be { foo: 'foo', bar: 'bar' }" do
      expect({ foo: 'foo', 'bar' => 'bar' }.symbolize_keys).to eq({ foo: 'foo', bar: 'bar' })
      expect({ foo: 'foo', 'bar' => 'bar' }.symbolize_keys!).to eq({ foo: 'foo', bar: 'bar' })
    end
  end

  describe "#symbolize_and_underscore_keys(!)" do
    it "to be { foo_bar: 'example', baz_bar: 'string' }" do
      expect({ 'foo Bar' => 'example', bazBar: 'string' }.symbolize_and_underscore_keys).to eq({ foo_bar: 'example', baz_bar: 'string' })
      expect({ 'foo Bar' => 'example', bazBar: 'string' }.symbolize_and_underscore_keys!).to eq({ foo_bar: 'example', baz_bar: 'string' })
    end
  end

  describe "#transform_keys(!)" do
    it "to be { 'FOO' => 'foo', 'BAZ' => 'bar' }" do
      expect({ foo: 'bar', baz: 'boo' }.transform_keys { |k| k.to_s.upcase }).to eq({ "FOO" => 'bar', "BAZ" => 'boo' })
      expect({ foo: 'bar', baz: 'boo' }.transform_keys! { |k| k.to_s.upcase }).to eq({ "FOO" => 'bar', "BAZ" => 'boo' })
    end
  end

  describe "#transform_values(!)" do
    it "to be { foo: 'BAR', baz: 'BOO' }" do
      expect({ foo: 'bar', baz: 'boo' }.transform_values { |v| v.to_s.upcase }).to eq({ foo: 'BAR', baz: 'BOO' })
      expect({ foo: 'bar', baz: 'boo' }.transform_values! { |v| v.to_s.upcase }).to eq({ foo: 'BAR', baz: 'BOO' })
    end
  end

end