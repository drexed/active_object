# frozen_string_literal: false

require 'spec_helper'

describe ActiveObject::String do

  describe '#any?' do
    it 'to be true' do
      expect('example string'.any?('example')).to eq(true)
      expect('example string'.any?('foo', 'string')).to eq(true)
    end

    it 'to be false' do
      expect('example string'.any?('foo')).to eq(false)
      expect('example string'.any?('foo', 'bar')).to eq(false)
    end
  end

  describe '#at' do
    it 'to be e' do
      expect('example'.at(0)).to eq('e')
      expect('example'.at(-1)).to eq('e')
    end

    it 'to be m' do
      expect('example'.at(3)).to eq('m')
    end

    it 'to be xam' do
      expect('example'.at(1..3)).to eq('xam')
    end

    it 'to be ""' do
      expect('example'.at(7..-1)).to eq('')
    end

    it 'to be pl' do
      expect('example'.at('pl')).to eq('pl')
      expect('example'.at(/pl/)).to eq('pl')
    end

    it 'to be nil' do
      expect('example'.at('xp')).to eq(nil)
      expect('example'.at(/xp/)).to eq(nil)
    end
  end

  describe '#camelize(!)' do
    it 'to be ExampleString' do
      expect('example_string'.camelize).to eq('ExampleString')
      expect('example_string'.camelcase).to eq('ExampleString')
      expect('example_string'.camelize!).to eq('ExampleString')
      expect('example_string'.camelcase!).to eq('ExampleString')
    end

    it 'to be exampleString' do
      expect('example_string'.camelize(:lower)).to eq('exampleString')
      expect('example_string'.camelcase(:lower)).to eq('exampleString')
      expect('example_string'.camelize!(:lower)).to eq('exampleString')
      expect('example_string'.camelcase!(:lower)).to eq('exampleString')
    end
  end

  describe '#classify' do
    it 'to be ExampleString' do
      expect('example_string'.classify).to eq('ExampleString')
      expect('example_string'.classify!).to eq('ExampleString')
    end

    it 'to be ExampleString::Test' do
      expect('example_string/test'.classify).to eq('ExampleString::Test')
      expect('example_string/test'.classify!).to eq('ExampleString::Test')
    end

    it 'to be Test' do
      expect('example_string.test'.classify).to eq('Test')
      expect('example_string.test'.classify!).to eq('Test')
    end
  end

  describe '#constantize' do
    # INFO: No test could be generated
  end

  describe '#deconstantize' do
    it 'to be String' do
      expect('Example::String'.deconstantize).to eq('Example')
      expect('Example::String'.deconstantize!).to eq('Example')
      expect('::Example::String'.deconstantize).to eq('::Example')
      expect('::Example::String'.deconstantize!).to eq('::Example')
      expect('String'.deconstantize).to eq('')
      expect('String'.deconstantize!).to eq('')
      expect('::String'.deconstantize).to eq('')
      expect('::String'.deconstantize!).to eq('')
      expect(''.deconstantize).to eq('')
      expect(''.deconstantize!).to eq('')
    end
  end

  describe '#demodulize' do
    it 'to be String' do
      expect('Example::String'.demodulize).to eq('String')
      expect('Example::String'.demodulize!).to eq('String')
      expect('String'.demodulize).to eq('String')
      expect('String'.demodulize!).to eq('String')
    end
  end

  describe '#dasherize' do
    it 'to be example-string' do
      expect('example_string'.dasherize).to eq('example-string')
      expect('example_string'.dasherize!).to eq('example-string')
    end
  end

  describe '#domain' do
    it 'to be ""' do
      expect(''.domain).to eq('')
    end

    it 'to be " "' do
      expect(' '.domain).to eq(' ')
    end

    it 'to be example string' do
      expect('example string'.domain).to eq('example string')
    end

    it 'to be www.example.com' do
      expect('http://www.example.com'.domain).to eq('www.example.com')
      expect('http://www.example.com/fake-page'.domain).to eq('www.example.com')
    end
  end

  describe '#downcase?' do
    it 'to be true' do
      expect('downcase'.downcase?).to eq(true)
      expect('downcase string'.downcase?).to eq(true)
    end

    it 'to be false' do
      expect('Mixedcase'.downcase?).to eq(false)
      expect('UPCASE'.downcase?).to eq(false)
      expect('Mixedcase string'.downcase?).to eq(false)
    end
  end

  describe '#ellipsize' do
    it 'to be 0123...WXYZ' do
      expect('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'.ellipsize(30)).to eq('0123...WXYZ')
    end

    it 'to be 0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ' do
      expect('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'.ellipsize(50)).to eq('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ')
    end

    it 'to be 012...XYZ' do
      expect('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'.ellipsize(30, offset: 3)).to eq('012...XYZ')
    end

    it 'to be 0123+++WXYZ' do
      expect('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'.ellipsize(30, separator: '+++')).to eq('0123+++WXYZ')
    end
  end

  describe '#exclude?' do
    it 'to be true' do
      expect('example_string'.exclude?('xxx')).to eq(true)
    end

    it 'to be false' do
      expect('example_string'.exclude?('exa')).to eq(false)
    end
  end

  describe '#first' do
    it 'to be e' do
      expect('example'.first).to eq('e')
    end

    it 'to be ""' do
      expect('example'.first(0)).to eq('')
    end

    it 'to be exa' do
      expect('example'.first(3)).to eq('exa')
    end
  end

  describe '#format' do
    it 'to be example string' do
      expect('example %s'.format('string')).to eq('example string')
    end

    it 'to be test example string' do
      expect('test %{one} %{two}'.format(one: 'example', two: 'string')).to eq('test example string')
    end

    it 'to be 1 + 2' do
      expect('%d + %d'.format([1, 2])).to eq('1 + 2')
    end
  end

  describe '#from' do
    it 'to be example' do
      expect('example'.from(0)).to eq('example')
    end

    it 'to be mple' do
      expect('example'.from(3)).to eq('mple')
    end
  end

  describe '#humanize(!)' do
    it 'to be Example string test' do
      expect('example_string_test'.humanize).to eq('Example string test')
      expect('example_string_test'.humanize!).to eq('Example string test')
      expect('_example_string_test_id'.humanize).to eq('Example string test')
      expect('_example_string_test_id'.humanize!).to eq('Example string test')

      unless defined?(ActiveSupport)
        expect('exampleStringTest'.humanize).to eq('Example string test')
        expect('exampleStringTest'.humanize!).to eq('Example string test')
        expect('ExampleStringTest'.humanize).to eq('Example string test')
        expect('ExampleStringTest'.humanize!).to eq('Example string test')
      end
    end

    it 'to be example string test' do
      expect('example_string_test'.humanize(capitalize: false)).to eq('example string test')
      expect('example_string_test'.humanize!(capitalize: false)).to eq('example string test')

      unless defined?(ActiveSupport)
        expect('exampleStringTest'.humanize(capitalize: false)).to eq('example string test')
        expect('exampleStringTest'.humanize!(capitalize: false)).to eq('example string test')
        expect('ExampleStringTest'.humanize(capitalize: false)).to eq('example string test')
        expect('ExampleStringTest'.humanize!(capitalize: false)).to eq('example string test')
      end
    end
  end

  describe '#indent(!)' do
    it 'to be "  example"' do
      expect('example'.indent(2)).to eq('  example')
      expect('example'.indent!(2)).to eq('  example')
    end

    it 'to be "\t\texample"' do
      expect('example'.indent(2, '\t')).to eq('\t\texample')
      expect('example'.indent!(2, '\t')).to eq('\t\texample')
    end
  end

  describe '#index_all' do
    it 'to be [0, 7, 13]' do
      expect('012324507654301243'.index_all(0)).to eq([0, 7, 13])
      expect('012324507654301243'.index_all('0')).to eq([0, 7, 13])
    end

    it 'to be [0, 13, 31]' do
      expect('the apple is the best fruit in the world'.index_all('the')).to eq([0, 13, 31])
    end

    it 'to be [1, 5, 9]' do
      expect('asdfasdfasdf'.index_all(/sd/)).to eq([1, 5, 9])
    end
  end

  describe '#labelize(!)' do
    it 'to be Example string test' do
      expect('example_string_test'.labelize).to eq('Example string test')
      expect('example_string_test'.labelize!).to eq('Example string test')
      expect('exampleStringTest'.labelize).to eq('Example string test')
      expect('exampleStringTest'.labelize!).to eq('Example string test')
      expect('ExampleStringTest'.labelize).to eq('Example string test')
      expect('ExampleStringTest'.labelize!).to eq('Example string test')
    end

    it 'to be Example string test Id' do
      expect('_example_string_test_id'.labelize).to eq('Example string test ID')
      expect('_example_string_test_id'.labelize!).to eq('Example string test ID')
    end
  end

  describe '#last' do
    it 'to be e' do
      expect('example'.last).to eq('e')
    end

    it 'to be ""' do
      expect('example'.last(0)).to eq('')
    end

    it 'to be ple' do
      expect('example'.last(3)).to eq('ple')
    end
  end

  describe '#mixedcase?' do
    it 'to be true' do
      expect('Mixedcase'.mixedcase?).to eq(true)
      expect('Mixedcase STRING type'.mixedcase?).to eq(true)
    end

    it 'to be false' do
      expect('downcase'.mixedcase?).to eq(false)
      expect('UPCASE'.mixedcase?).to eq(false)
    end
  end

  describe '#ordinal' do
    it 'to be st' do
      expect('1'.ordinal).to eq('st')
    end

    it 'to be nd' do
      expect('2'.ordinal).to eq('nd')
    end

    it 'to be rd' do
      expect('3'.ordinal).to eq('rd')
    end

    it 'to be th' do
      expect('11'.ordinal).to eq('th')
    end
  end

  describe '#ordinalize' do
    it 'to be st' do
      expect('1'.ordinalize).to eq('1st')
    end

    it 'to be nd' do
      expect('2'.ordinalize).to eq('2nd')
    end

    it 'to be rd' do
      expect('3'.ordinalize).to eq('3rd')
    end

    it 'to be th' do
      expect('11'.ordinalize).to eq('11th')
    end
  end

  describe '#parameterize(!)' do
    it 'to be example-string' do
      expect('example string'.parameterize).to eq('example-string')
      expect('example string'.parameterize!).to eq('example-string')
    end

    it 'to be example_string' do
      expect('example string'.parameterize(separator: '?')).to eq('example?string')
      expect('example string'.parameterize!(separator: '?')).to eq('example?string')
    end
  end

  describe '#pollute(!)' do
    it 'to be t^--^--^e^--^--^s^--^--^t^--^--^' do
      expect('test'.pollute).to eq('t^--^--^e^--^--^s^--^--^t^--^--^')
      expect('test'.pollute!).to eq('t^--^--^e^--^--^s^--^--^t^--^--^')
    end

    it 'to be t-e-s-t-' do
      expect('test'.pollute('-')).to eq('t-e-s-t-')
      expect('test'.pollute!('-')).to eq('t-e-s-t-')
    end
  end

  describe '#pop' do
    it 'to be r' do
      expect('tester'.pop).to eq('r')
    end
  end

  describe '#push' do
    it 'to be tester' do
      expect('test'.push('er')).to eq('tester')
    end
  end

  describe '#remove(!)' do
    it 'to be "this  that "' do
      expect('this thing that thing'.remove('thing')).to eq('this  that ')
      expect('this thing that thing'.remove!('thing')).to eq('this  that ')
      expect('this thing that them'.remove('thing', 'them')).to eq('this  that ')
      expect('this thing that them'.remove!('thing', 'them')).to eq('this  that ')

      unless defined?(ActiveSupport)
        expect('this thing that thing'.remove(1..3)).to eq('t thing that thing')
        expect('this thing that thing'.remove!(1..3)).to eq('t thing that thing')
        expect('this thing that them'.remove('thing', 1..3)).to eq('t  that them')
        expect('this thing that them'.remove!('thing', 1..3)).to eq('t  that them')
      end
    end
  end

  describe '#remove_tags(!)' do
    it 'to be example' do
      expect('example'.remove_tags).to eq('example')
      expect('example'.remove_tags!).to eq('example')
    end

    it 'to be click' do
      expect('<a href="http://example.com">click</a>'.remove_tags).to eq('click')
      expect('<a href="http://example.com">click</a>'.remove_tags!).to eq('click')
    end

    it 'to be this is bold and emphatic' do
      expect('this is <b>bold</b> and <em>emphatic</em>'.remove_tags).to eq('this is bold and emphatic')
      expect('this is <b>bold</b> and <em>emphatic</em>'.remove_tags!).to eq('this is bold and emphatic')
    end
  end

  describe '#sample(!)' do
    it 'to be true' do
      expect('this thing that thing'.include?('this thing that thing'.sample)).to eq(true)
      expect('this thing that thing'.include?('this thing that thing'.sample!)).to eq(true)
    end
  end

  describe '#shift(!)' do
    it 'to be "t"' do
      expect('this thing that thing'.shift).to eq('t')
      expect('this thing that thing'.shift!).to eq('t')
    end

    it 'to be "this  that thing"' do
      expect('this thing that thing'.shift('thing')).to eq('this  that thing')
      expect('this thing that thing'.shift!('thing')).to eq('this  that thing')
    end

    it 'to be " thing  thing"' do
      expect('this thing that thing'.shift('this', 'that')).to eq(' thing  thing')
      expect('this thing that thing'.shift!('this', 'that')).to eq(' thing  thing')
    end
  end

  describe '#shuffle(!)' do
    it 'to not be "this thing that thing"' do
      expect('this thing that thing'.shuffle).not_to eq('this thing that thing')
      expect('this thing that thing'.shuffle!).not_to eq('this thing that thing')
    end
  end

  describe '#sift(!)' do
    it 'to be "23456789"' do
      expect('qa2ws3ed4rf5tg6yh7uj8ik9ol'.sift('0123456789')).to eq('23456789')
      expect('qa2ws3ed4rf5tg6yh7uj8ik9ol'.sift!('0123456789')).to eq('23456789')
      expect('qa2ws3ed4rf5tg6yh7uj8ik9ol'.sift(0..9)).to eq('23456789')
      expect('qa2ws3ed4rf5tg6yh7uj8ik9ol'.sift!(0..9)).to eq('23456789')
      expect('qa2ws3ed4rf5tg6yh7uj8ik9ol'.sift([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])).to eq('23456789')
      expect('qa2ws3ed4rf5tg6yh7uj8ik9ol'.sift!([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])).to eq('23456789')
    end
  end

  describe '#slugify(!)' do
    it 'to be example' do
      expect('example'.slugify).to eq('example')
      expect('example'.slugify!).to eq('example')
    end

    it 'to be example-string' do
      expect('example string'.slugify).to eq('example-string')
      expect('example string'.slugify!).to eq('example-string')
    end

    it 'to be example-string-test' do
      expect('Example string @@@ test!'.slugify).to eq('example-string-test')
      expect('Example string @@@ test!'.slugify!).to eq('example-string-test')
    end

    it 'to be a-real-doozie' do
      expect(' A REal Doozi\'e?  \' '.slugify).to eq('a-real-doozie')
      expect(' A REal Doozi\'e?  \' '.slugify!).to eq('a-real-doozie')
    end
  end

  describe '#sort(!)' do
    it 'to be "abcde"' do
      expect('adbec'.sort).to eq('abcde')
      expect('adbec'.sort!).to eq('abcde')
    end
  end

  describe '#squish(!)' do
    it 'to be example test' do
      expect('example     test'.squish).to eq('example test')
      expect("example  \n   \t   test".squish!).to eq('example test')
      expect("  example  \n   \t   test  ".squish).to eq('example test')
      expect('  example     test  '.squish!).to eq('example test')
    end
  end

  describe '#titleize(!)' do
    it 'to be Example String Test' do
      expect('example string test'.titleize).to eq('Example String Test')
      expect('example string test'.titlecase).to eq('Example String Test')
      expect('example string test'.titleize!).to eq('Example String Test')
      expect('example string test'.titlecase!).to eq('Example String Test')
      expect('Example string Test'.titleize).to eq('Example String Test')
      expect('Example string Test'.titleize!).to eq('Example String Test')
      expect('ExampleStringTest'.titleize).to eq('Example String Test')
      expect('ExampleStringTest'.titleize!).to eq('Example String Test')
      expect('Example_string_test'.titleize).to eq('Example String Test')
      expect('Example_string_test'.titleize!).to eq('Example String Test')
    end
  end

  describe '#to' do
    it 'to be e' do
      expect('example'.to(0)).to eq('e')
    end

    it 'to be exampl' do
      expect('example'.to(-2)).to eq('exampl')
    end

    it 'to be exam' do
      expect('example'.to(3)).to eq('exam')
    end
  end

  describe '#truncate' do
    it 'to be ...' do
      expect('example string'.truncate(3)).to eq('...')
    end

    it 'to be exa...' do
      expect('example string'.truncate(6)).to eq('exa...')
    end

    it 'to be example...' do
      expect('example string'.truncate(12, separator: ' ')).to eq('example...')
    end

    it 'to be exa... (more)' do
      expect('example string'.truncate(13, omission: '... (more)')).to eq('exa... (more)')
    end

    it 'to be example string' do
      expect('example string'.truncate(15)).to eq('example string')
    end
  end

  describe '#truncate_words' do
    it 'to be example...' do
      expect('example string test'.truncate_words(1)).to eq('example...')
    end

    it 'to be Once<br>upon<br>a<br>time<br>in...' do
      str = 'Once<br>upon<br>a<br>time<br>in<br>a<br>world'

      expect(str.truncate_words(5, separator: '<br>')).to eq('Once<br>upon<br>a<br>time<br>in...')
    end

    it 'to be And they found that many... (continued)' do
      str = 'And they found that many people were sleeping better.'

      expect(str.truncate_words(5, omission: '... (continued)')).to eq('And they found that many... (continued)')
    end
  end

  describe '#underscore(!)' do
    it 'to be example_string' do
      expect('ExampleString'.underscore).to eq('example_string')
      expect('ExampleString'.underscore!).to eq('example_string')
      expect('exampleString'.underscore).to eq('example_string')
      expect('exampleString'.underscore!).to eq('example_string')
      expect('example_string'.underscore).to eq('example_string')
      expect('example_string'.underscore!).to eq('example_string')
      expect('example_String'.underscore).to eq('example_string')
      expect('example_String'.underscore!).to eq('example_string')
      expect('EXAMPLE_String'.underscore!).to eq('example_string')
    end

    it 'to be example_string/test' do
      expect('ExampleString::Test'.underscore).to eq('example_string/test')
      expect('ExampleString::Test'.underscore!).to eq('example_string/test')
    end
  end

  describe '#unpollute(!)' do
    it 'to be test' do
      expect('test'.unpollute).to eq('test')
      expect('test'.unpollute!).to eq('test')
    end

    it 'to be test' do
      expect('t-e-s-t-'.unpollute('-')).to eq('test')
      expect('t-e-s-t-'.unpollute!('-')).to eq('test')
    end
  end

  describe '#upcase?' do
    it 'to be true' do
      expect('UPCASE'.upcase?).to eq(true)
      expect('UPCASE STRING'.upcase?).to eq(true)
    end

    it 'to be false' do
      expect('downcase'.upcase?).to eq(false)
      expect('Mixedcase'.upcase?).to eq(false)
      expect('Mixedcase string'.upcase?).to eq(false)
    end
  end

  describe '#unshift(!)' do
    it 'to be "thing this thing that thing"' do
      expect('this thing that thing'.unshift('thing ')).to eq('thing this thing that thing')
      expect('this thing that thing'.unshift!('thing ')).to eq('thing this thing that thing')
    end

    it 'to be "this that this thing that thing"' do
      expect('this thing that thing'.unshift('this ', 'that ')).to eq('this that this thing that thing')
      expect('this thing that thing'.unshift!('this ', 'that ')).to eq('this that this thing that thing')
    end
  end

end
