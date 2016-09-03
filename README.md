# ActiveObject

[![Gem Version](https://badge.fury.io/rb/active_object.svg)](http://badge.fury.io/rb/active_object)
[![Build Status](https://travis-ci.org/drexed/active_object.svg?branch=master)](https://travis-ci.org/drexed/active_object)
[![Coverage Status](https://coveralls.io/repos/github/drexed/active_object/badge.svg?branch=master)](https://coveralls.io/github/drexed/active_object?branch=master)

ActiveObject is a collection of commonly used object helpers in a ruby based project.

Highly recommended extensions:
  * **Hash:** Hashie - https://github.com/intridea/hashie
  * **String:** Escape Utils - https://github.com/brianmario/escape_utils
  * **String:** Fast Blank - https://github.com/SamSaffron/fast_blank
  * **Translation:** Fast Gettext - https://github.com/grosser/fast_gettext
  * **Facets:** Facets - https://github.com/rubyworks/facets

## Installation

Add this line to your application's Gemfile:

    gem 'active_object'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_object

## Table of Contents

* [Configuration](#configuration)
* [Array](#array)
* [Enumerable](#enumerable)
* [Hash](#hash)
* [Integer](#integer)
* [Numeric](#numeric)
* [Object](#object)
* [Range](#Rrange)
* [String](#string)
* [Time](#time)

## Configuration

`rails g active_object:install` will generate the following `active_object.rb` file:

```ruby
# config/initalizers/active_object.rb

ActiveObject.configure do |config|
  config.autoload_array = true
  config.autoload_date = true
  config.autoload_enumerable = true
  config.autoload_hash = true
  config.autoload_integer = true
  config.autoload_numeric = true
  config.autoload_object = true
  config.autoload_range = true
  config.autoload_string = true
  config.autoload_time = true
end
```

## Array

####After:####
`after` returns the value after the given value.

```ruby
['1', '2', '3'].after('2') #=> '3'
['1', '2', '3'].after('3') #=> '1'
['1', '2', '3'].after('4') #=> nil
```

####Before:####
`before` returns the value before the given value.

```ruby
['1', '2', '3'].before('2') #=> '1'
['1', '2', '3'].before('1') #=> '3'
['1', '2', '3'].before('4') #=> nil
```

####Delete First:####
`delete_first` and `delete_first!` removes the first element from an array. Like Array.shift, but returns the array instead of the removed element.

```ruby
['1', '2', '3'].delete_first #=> ['2', '3']
```

####Delete Last:####
`delete_last` and `delete_last!` removes the last element from an array. Like Array.pop, but returns the array instead of the removed element.

```ruby
['1', '2', '3'].delete_last #=> ['1', '2']
```

####Delete Values:####
`delete_values` delete multiple values from array.

```ruby
[1, 2, 3, 4].delete_values(1, 3) #=> [2, 4]
```

####Dig:####
`dig` returns the value of a nested array.

```ruby
['zero', ['ten', 'eleven', 'twelve'], 'two'].dig(1, 2) #=> 'twelve'
```

####Duplicates:####
`duplicates` returns list of duplicate elements.

```ruby
[1, 1, 2, 2, 2, 3].duplicates    #=> [1, 2]
[1, 1, 2, 2, 2, 3].duplicates(3) #=> [2]
```

####From:####
`from` returns the tail of the array from position.

```ruby
['1', '2', '3'].from(0) #=> ['1', '2', '3']
['1', '2', '3'].from(1) #=> ['2', '3']
['1', '2', '3'].from(-1) #=> ['3']
```

####Groups:####
`groups` splits or iterates over the array in number of groups.

```ruby
%w(1 2 3 4 5 6 7 8 9 10).groups(3) #=> [['1', '2', '3', '4'], ['5', '6', '7'], ['8', '9', '10']]
```

####In Groups:####
`in_groups` splits or iterates over the array in number of groups, padding any remaining slots with fill_with unless it is false.

```ruby
%w(1 2 3 4 5 6 7 8 9 10).in_groups(3)           #=> [['1', '2', '3', '4'], ['5', '6', '7', nil], ['8', '9', '10', nil]]
%w(1 2 3 4 5 6 7 8 9 10).in_groups(3, '&nbsp;') #=> [['1', '2', '3', '4'], ['5', '6', '7', '&nbsp;'], ['8', '9', '10', '&nbsp;']]
%w(1 2 3 4 5 6 7 8 9 10).in_groups(3, false)    #=> [['1', '2', '3', '4'], ['5', '6', '7'], ['8', '9', '10']]
```

####In Groups Of:####
`in_groups_of` splits or iterates over the array in groups of size number, padding any remaining slots with fill_with unless it is false.

```ruby
%w(1 2 3 4 5 6 7 8 9 10).in_groups_of(3)           #=> [['1', '2', '3'], ['4', '5', '6'], ['7', '8', '9'], ['10', nil, nil]]
%w(1 2 3 4 5 6 7 8 9 10).in_groups_of(3, '&nbsp;') #=> [['1', '2', '3'], ['4', '5', '6'], ['7', '8', '9'], ['10', '&nbsp;', '&nbsp;']]
%w(1 2 3 4 5 6 7 8 9 10).in_groups_of(3, false)    #=> [['1', '2', '3'], ['4', '5', '6'], ['7', '8', '9'], ['10']]
```

####Percentile:####
`percentile` returns the percentile value for a given percentage.

```ruby
[1, 2, 3, 4].percentile(49)    # => 2
[1, 2, 3, 4].percentile(50)    # => 3
[1, 2, 3, 4, 5].percentile(50) # => 3
```

####Probablity:####
`probability` generates a hash mapping each unique element in the array to the relative frequency, i.e. the probablity, of it appearence.

```ruby
[:a, :b, :c, :c].probability #=> { a: 0.25, b: 0.25, c: 0.5 }
```

####Reject Values:####
`reject_values` delete multiple values from array from a array copy.

```ruby
[1, 2, 3, 4, 5].reject_values(2,4) #=> [1, 3, 5]
```

####Sample:####
`sample!` deletes a random value and returns that value.

```ruby
[1, 2, 3, 4, 5].sample! #=> 2
```

####Split:####
`split` divides the array into one or more subarrays based on a delimiting value or the result of an optional block.

```ruby
[1, 2, 3, 4, 5].split(3)              # => [[1, 2], [4, 5]]
(1..10).to_a.split { |i| i % 3 == 0 } # => [[1, 2], [4, 5], [7, 8], [10]]
```

####Strip:####
`strip` and `strip!` removes blank elements from an array.

```ruby
['this', '', 'that', nil, false].strip  #=> ['this', 'that']
'this    is   a  test'.split(' ').strip #=> ['this', 'is', 'a', 'test']
```

####To:####
`to` returns the beginning of the array up to position.

```ruby
['1', '2', '3'].to(0) #=> ['1']
['1', '2', '3'].to(1) #=> ['1', '2']
['1', '2', '3'].to(-1) #=> ['3']
```

####To Sentence:####
`to_sentence` converts the array to a comma-separated sentence where the last element is joined by the connector word.

**Options:**
 * words_connector:     “, ”
 * two_words_connector: “ and ”
 * last_word_connector: “, and ”

```ruby
[].to_sentence                                                                                     #=> ''
['one'].to_sentence                                                                                #=> 'one'
['one', 'two'].to_sentence                                                                         #=> 'one and two'
['one', 'two', 'three'].to_sentence                                                                #=> 'one, two, and three'
['one', 'two'].to_sentence(two_words_connector: '-')                                               #=> 'one-two'
['one', 'two', 'three'].to_sentence(words_connector: ' or ', last_word_connector: ' or at least ') #=> 'one or two or at least three'
```

## Enumerable

####Cluster:####
`cluster` clusters together adjacent elements into a list of sub-arrays.

```ruby
[2,2,2,3,3,4,2,2,1].cluster { |x| x } #=> [[2, 2, 2], [3, 3], [4], [2, 2], [1]]
```

####Difference:####
`difference` returns the difference of a collection of numbers.

```ruby
[].difference #=> 0
[].difference(nil) #=> nil
[1,2,3].difference #=> -4
```

####Divisible:####
`divisible` returns the division of a collection of numbers.

```ruby
[].divisible       #=> 0
[].divisible(nil)  #=> nil
[16,4,2].divisible #=> 2
```

####Drop Last:####
`drop_last` drops the last number of elements of a collection.

```ruby
[].drop_last(1)      #=> []
[1,2,3].drop_last(1) #=> [1,2]
[1,2,3].drop_last(2) #=> [1]
```

####Drop Last If:####
`drop_last_if` drops the last number of elements of a collection while it meets a criteria.

```ruby
[].drop_last_if(&:odd?)        #=> []
[1,2,3].drop_last_if(&:odd?)   #=> [1,2]
[1,2,3,4].drop_last_if(&:odd?) #=> [1,2,3,4]
```

####Exactly:####
`exactly?` returns if there are exactly the number of an element type.

```ruby
[].exactly?(1)                 #=> false
[1,2,3].excatly?(3)            #=> true
[1,1,3,3].exactly?(2, &:even?) #=> false
```

####Exclude:####
`exclude?` returns true if the collection does not include the object.

```ruby
[1, 2, 3].exclude?(4) #=> true
[1, 2, 3].exclude?(3) #=> false
```

####Expand:####
`expand` expand all elements of an Enumerable object.

```ruby
[0, 2..3, 5..7].expand #=> [0,[2, 3],[5,6,7]]
```

####Exponential:####
`exponential` returns the exponential of a collection of numbers.

```ruby
[].exponential      #=> 0
[].exponential(nil) #=> nil
[2,3,4].exponential #=> 4096
```

####Frequencies:####
`frequencies` returns a hash of the number of times a value in an array appears.

```ruby
[].frequencies                                    #=> {}
[1, :symbol, 'string', 3, :symbol, 1].frequencies #=> { 1 => 2, :symbol => 2, 'string' => 1, 3 => 1 }
```

####Incase:####
`incase?` the same as #include? but tested using #=== instead of #==.

```ruby
[1, 2, 'a'].incase?(String) #=> true
[1, 2, 'a'].incase?(3)      #=> false
```

####Many:####
`many?` returns if collection has more than one element while respecting nil and false as an element.

```ruby
[].many?                 #=> false
[1,2,3].many?            #=> true
[1, false, nil].many?    #=> true
[1,1,3,3].many?(&:even?) #=> false

```

####Max:####
`max` returns the largest value of a collection of numbers.

```ruby
[].max      #=> 0
[].max(nil) #=> nil
[1,2,3].max #=> 3
```

####Min:####
`min` returns the smallest value of a collection of numbers.

```ruby
[].min      #=> 0
[].min(nil) #=> nil
[1,2,3].min #=> 1
```

####Mean:####
`mean` and `average` returns the average of a collection of numbers.

```ruby
[].mean      #=> 0
[].mean(nil) #=> nil
[1,2,3].mean #=> 2
```

####Median:####
`median` returns the middle value of a collection of numbers.

```ruby
[].median        #=> 0
[].median(nil)   #=> nil
[1,2,6].median   #=> 2
[1,2,3,6].median #=> 2.5
```

####Mode:####
`mode` returns the most frequent value of a collection of numbers.

```ruby
[].mode        #=> 0
[].mode(nil)   #=> nil
[1,2,3].mode   #=> nil
[1,1,2,6].mode #=> 1
```

####Multiple:####
`multiple` returns the multiplication of a collection of numbers.

```ruby
[].multiple      #=> 0
[].multiple(nil) #=> nil
[1,2,3].multiple #=> 6
```

####Range:####
`range` returns the difference between the smallest and largest value of a collection of numbers.

```ruby
[].range      #=> 0
[].range(nil) #=> nil
[1,2,6].range #=> 5
```

####Several:####
`several?` returns if collection has more than one element while not respecting nil and false as an element.

```ruby
[].several?                 #=> false
[1,2,3].several?            #=> true
[1, false, nil].several?    #=> false
[1,1,3,3].several?(&:even?) #=> false
```

####Standard Deviation:####
`standard_deviation` returns the standard deviation of elements of a collection.

```ruby
[].standard_deviation      #=> 0
[].standard_deviation(nil) #=> nil
[1,2,6].standard_deviation #=> 2.6457513110645907
```

####Sum:####
`sum` returns the sum of a collection of numbers.

```ruby
[].sum             #=> 0
[1,2,3].sum        #=> 6
['foo', 'bar'].sum #=> 'foobar'
```

####Take Last:####
`take_last` returns the last number of elements of a collection.

```ruby
[].take_last(1)      #=> []
[1,2,3].take_last(1) #=> [3]
[1,2,3].take_last(2) #=> [2,3]
```

####Take Last If:####
`take_last_if` returns the last number of elements of a collection while it meets a criteria.

```ruby
[].take_last_if(&:odd?)        #=> []
[1,2,3].take_last_if(&:odd?)   #=> [3]
[1,2,3,4].take_last_if(&:odd?) #=> []
```

####Variance:####
`variance` returns the variance of elements of a collection.

```ruby
[].variance      #=> 0
[].variance(nil) #=> nil
[1,2,6].variance #=> 7
```

## Hash

####Assert Valid Keys:####
`assert_valid_keys` raises an error if key is not included in a list of keys.

```ruby
{}.assert_valid_keys(:foo)                               #=> {}
{ foo: 'bar' }.assert_valid_keys(:foo)                   #=> { foo: 'bar' }
{ foo: 'bar', baz: 'boz' }.assert_valid_keys(:foo, :boo) #=> raises 'ArgumentError: Unknown key: :baz. Valid keys are: :foo, :boo'
```

####Compact:####
`compact` and `compact!` returns a hash with non nil values.

```ruby
{}.compact                                   #=> {}
{ foo: nil }.compact                         #=> {}
{ foo: 'bar', baz: false, boo: nil }.compact #=> { foo: 'bar', baz: false }
```

####Deep Merge:####
`deep_merge` and `deep_merge!` returns a new hash with self and other_hash merged recursively.

```ruby
h1 = { a: true, b: { c: [1, 2, 3] } }
h2 = { a: false, b: { x: [3, 4, 5] } }

h1.deep_merge(h2) #=> { a: false, b: { c: [1, 2, 3], x: [3, 4, 5] } }
```

####Dig:####
`dig` returns the value of a nested hash.

```ruby
h1 = { a: { b: { c: :d } } }

h1.dig(:a, :b)     #=> { c: :d }
h1.dig(:a, :b, :c) #=> :d
```

####Except:####
`except` and `except!` returns a hash that includes everything but the given keys.

```ruby
{}.except(:foo)                                                    #=> {}
{ foo: 'foo', baz: 'baz', bar: 'bar' }.except(:foo)                #=> { baz: 'baz', bar: 'bar' }
{ :foo => 'foo', :baz => 'baz', :bar => 'bar' }.except(:baz, :bar) #=> { :foo => 'foo' }
```

####Hmap:####
`hmap` and `hmap!` returns a hash that is transformed in place.

```ruby
{ a: 1, b: 2, c: 3 }.hmap { |k, v| { k => v + 3 } } #=> { a: 4, b: 5, c: 6 }
```

####Nillify:####
`nillify` and `nillify!` transforms all blank values to nil.

```ruby
{ a: 1, b: 'test', c: nil, d: false, e: '', f: ' ' }.nillify #=> {a: 1, b: 'test', c: nil, d: nil, e: nil, f: nil}
```

####Only:####
`only` and `only!` returns only key/value pairs matching certain keys.

```ruby
{}.only(:foo)                                                    #=> {}
{ foo: 'foo', baz: 'baz', bar: 'bar' }.only(:foo)                #=> { foo: 'foo' }
{ :foo => 'foo', :baz => 'baz', :bar => 'bar' }.only(:baz, :bar) #=> { :baz => 'baz', :bar => 'bar' }
```

####Rename Keys:####
`rename_keys` and `rename_keys!` rename the keys of a hash.

```ruby
{ foo: 'foo', baz: 'baz' }.rename_keys(foo: :bar)                      #=> { bar: 'foo', baz: 'baz' }
{ foo: 'foo', 'baz' => 'baz' }.rename_keys(foo: :bar, 'baz' => 'tick') #=> { bar: 'foo', tick: 'baz' }
```

####Reverse Merge:####
`reverse_merge` and `reverse_merge!` merges one hash into other hash.

```ruby
{}.reverse_merge!(foo: 'bar')                         #=> { foo: 'bar' }
{ foo: 'bar' }.reverse_merge!(baz: 'boo', boo: 'bam') #=> { foo: 'bar', baz: 'boo', boo: 'bam' }
```

####Sample:####
`sample` returns a random key-value pair.
`sample!` deletes a random key-value pair and returns that pair.

```ruby
h = { a: 1, b: 2, c: 3, d: 4 }

h.sample  #=> [:c, 3]
h.sample! #=> [:a, 1]
```

####Sample Key:####
`sample_key` returns a random key.
`sample_key!` delete a random key-value pair, returning the key.

```ruby
h = { a: 1, b: 2, c: 3, d: 4 }

h.sample_key  #=> :b
h.sample_key! #=> :d
```

####Sample Value:####
`sample_value` returns a random value.
`sample_value!` delete a random key-value pair, returning the value.

```ruby
h = { a: 1, b: 2, c: 3, d: 4 }

h.sample_value  #=> 1
h.sample_value! #=> 3
```

####Shuffle:####
`shuffle` returns a copy of the hash with values arranged in new random order.
`shuffle!` returns the hash with values arranged in new random order.

```ruby
h = { a: 1, b: 2, c: 3, d: 4 }

h.shuffle  #=> { b: 2, c: 3, a: 1, d: 4 }
h.shuffle! #=> { d: 4, b: 2, c: 3, a: 1 }
```

####Slice:####
`slice` a hash to include only the given keys. Returns a hash containing the given keys.
`slice!` replaces the hash with only the given keys. Returns a hash containing the removed key/value pairs.

```ruby
h = { a: 1, b: 2, c: 3, d: 4 }

h.slice(:a, :b)  #=> { a: 1, b: 2 }
h.slice!(:a, :b) #=> { c: 3, d: 4 }
```

####Stringify Keys:####
`stringify_keys` and `stringify_keys!` converts the hash keys to strings.

```ruby
{ foo: 'foo', 'bar' => 'bar' }.stringify_keys #=> { 'foo' => 'foo', 'baz' => 'baz' }
```

####Strip:####
`strip` and `strip!` returns a hash with non nil, false, or blank values.

```ruby
{}.strip                                                      #=> {}
{ foo: nil, baz: false, boo: '', faz: ' ' }.strip             #=> {}
{ foo: 'bar', baz: false, boo: nil, boz: '', faz: ' ' }.strip #=> { foo: 'bar' }
```

####Symbolize Keys:####
`symbolize_keys` and `symbolize_keys!` converts the hash keys to symbols.

```ruby
{ foo: 'foo', 'bar' => 'bar' }.symbolize_keys #=> { foo: 'foo', baz: 'baz' }
```

####Symbolize and Underscore Keys:####
`symbolize_and_underscore_keys` and `symbolize_and_underscore_keys!` symbolize and underscore hash keys.

```ruby
{ 'firstName' => 'foo', 'last Name' => 'test' }.symbolize_and_underscore_keys #=> { first_name: 'foo', last_name: 'test' }
```

####Transform Keys:####
`transform_keys` and `transform_keys!` a new hash with all keys converted using the block operation.

```ruby
{ foo: 'bar', baz: 'boo' }.transform_keys { |k| k.to_s.upcase } #=> { 'FOO' => 'bar', 'BAZ' => 'boo' }
```

####Transform Values:####
`transform_values` and `transform_values!` a new hash with all values converted using the block operation.

```ruby
{ foo: 'bar', baz: 'boo' }.transform_values { |v| v.to_s.upcase } #=> {foo: 'BAR', baz: 'BOO' }
```

## Integer

####Factorial:####
`factorial` calculate the factorial of an integer.

```ruby
4.factorial #=> 24
```

####Of:####
`of` is like #times but returns a collection of the yield results.

```ruby
3.of { |i| '#{i+1}' } #=> ['1', '2', '3']
```

####Roman:####
`roman` converts this integer to a roman numeral.

```ruby
49.roman #=> 'XLIX'
```

####Time:####
`time` returns a Time object for the given Integer.

```ruby
3.time #=> '1969-12-31 19:00:03.000000000 -0500'
```

## Numeric

####Add:####
`add` returns the sum of two numbers.

```ruby
4.add(2) #=> 6
```

####Bytes in Bytes:####
`byte_in_bytes` and `bytes_in_bytes` returns self.

```ruby
3.bytes_in_bytes #=> 3
```

####Centigrams in Grams:####
`centigram_in_grams` and `centigrams_in_grams` returns the amount of grams in n centigrams.

```ruby
3.centigrams_in_grams #=> 0.03
```

####Centimeters in Meters:####
`centimeter_in_meters` and `centimeters_in_meters` returns the amount of meters in n centimeters.

```ruby
3.centimeters_in_meters #=> 0.03
```

####Centuries_in_seconds:####
`century_in_seconds` and `centuries_in_seconds` returns the amount of seconds in n centuries.

```ruby
3.centuries_in_seconds #=> 9467280000.0
```

####Clamp:####
`clamp` returns a comparable between a lower and upper bound.

```ruby
1.clamp(3, 6) # => 3
5.clamp(3..6) # => 5
8.clamp(3, 6) # => 6
```

####Days in Seconds:####
`day_in_seconds` and `days_in_seconds` returns the amount of seconds in n days.

```ruby
3.days_in_seconds #=> 259200
```

####Decades in Seconds:####
`decade_in_seconds` and `decades_in_seconds` returns the amount of seconds in n decades.

```ruby
3.decades_in_seconds #=> 946728000.0
```
####Decagrams in Grams:####
`decagram_in_grams` and `decagrams_in_grams` returns the amount of grams in n decagrams.

```ruby
3.decagrams_in_grams #=> 30
```

####Decameters in Meters:####
`decameter_in_meters` and `decameters_in_meters` returns the amount of meters in n decameters.

```ruby
3.decameters_in_meters #=> 30
```

####Decigrams in Grams:####
`decigram_in_grams` and `decigrams_in_grams` returns the amount of grams in n decigrams.

```ruby
3.decigrams_in_grams #=> 0.3
```

####Decimeters in Meters:####
`decimeter_in_meters` and `decimeters_in_meters` returns the amount of meters in n decimeters.

```ruby
3.decimeters_in_meters #=> 0.3
```

####degrees_to_radians:####
`degrees_to_radians` returns number of degrees into radians.

```ruby
90.degrees_to_radians #=> 1.5707963267948966
```

####Distance:####
`distance` returns the absolute difference between numbers.

```ruby
5.distance(3) #=> 2
3.distance(5) #=> 2
```

####Divide:####
`divide` returns the division of two numbers.

```ruby
4.divide(2) #=> 2
```

####Exabytes in Bytes:####
`exabyte_in_bytes` and `exabytes_in_bytes` returns the amount of bytes in n exabytes.

```ruby
3.exabytes_in_bytes #=> 3458764513820540928
```

####Feet in Inches:####
`foot_in_inches` and `feet_in_inches` returns the amount of inches in n feet.

```ruby
3.feet_in_inches #=> 36
```

####Gigabytes in Bytes:####
`gigabyte_in_bytes` and `gigabytes_in_bytes` returns the amount of bytes in n gigabytes.

```ruby
3.gigabytes_in_bytes #=> 3221225472
```

####Grams in Grams:####
`gram_in_grams` and `grams_in_grams` returns self.

```ruby
3.grams_in_grams #=> 3
```

####Greater Than:####
`greater_than?` returns true if self is greater than n.

```ruby
3.greater_than?(2) #=> true
3.greater_than?(3) #=> false
3.greater_than?(4) #=> false
```

####Greater Than or Equal To:####
`greater_than_or_equal_to?` returns true if self is greater than or equal to n.

```ruby
3.greater_than_or_equal_to?(2) #=> true
3.greater_than_or_equal_to?(3) #=> true
3.greater_than_or_equal_to?(4) #=> false
```

####Hectograms in Grams:####
`hectogram_in_grams` and `hectograms_in_grams` returns the amount of grams in n hectograms.

```ruby
3.hectograms_in_grams #=> 300
```

####Hectometers in Meters:####
`hectometer_in_meters` and `hectometers_in_meters` returns the amount of meters in n hectometers.

```ruby
3.hectometers_in_meters #=> 300
```

####Hours in Seconds:####
`hour_in_seconds` and `hours_in_seconds` returns the amount of seconds in n hours.

```ruby
3.hours_in_seconds #=> 10800
```

####Inches in Inches:####
`inch_in_inches` and `inches_in_inches` returns the amount of inches in n inches.

```ruby
3.inches_in_inches #=> 3
```

####Inside:####
`inside?` returns true if n is greater than start and less than finish. Similar to between but does not return true if equal to self.

```ruby
3.inside?(1, 5) #=> true
3.inside?(3, 5) #=> false
```

####Kilobytes in Bytes:####
`kilobyte_in_bytes` and `kilobytes_in_bytes` returns the amount of bytes in n kilobytes.

```ruby
3.kilobytes_in_bytes #=> 3072
```

####Kilograms in Grams:####
`kilogram_in_grams` and `kilograms_in_grams` returns the amount of grams in n kilograms.

```ruby
3.kilograms_in_grams #=> 3000
```

####Kilometers in Meters:####
`kilometer_in_meters` and `kilometers_in_meters` returns the amount of meters in n kilometers.

```ruby
3.kilometers_in_meters #=> 3000
```

####Less Than:####
`less_than?` returns true if self is less than n.

```ruby
3.less_than?(2) #=> false
3.less_than?(3) #=> false
3.less_than?(4) #=> true
```

####Less Than or Equal To:####
`less_than_or_equal_to?` returns true if self is less than or equal to n.

```ruby
3.less_than_or_equal_to?(2) #=> false
3.less_than_or_equal_to?(3) #=> true
3.less_than_or_equal_to?(4) #=> true
```

####Metric Ton in Ounces:####
`metric_ton_in_ounces` and `metric_tons_in_ounces` returns the amount of grams in n metric_tons.

```ruby
3.metric_tons_in_ounces #=> 3000000
```

####Megabytes in Bytes:####
`megabyte_in_bytes` and `megabytes_in_bytes` returns the amount of bytes in n megabytes.

```ruby
3.megabytes_in_bytes #=> 3145728
```

####Meters in Meters:####
`meter_in_meters` and `meters_in_meters` returns self.

```ruby
3.meters_in_meters #=> 3
```

####Miles in Inches:####
`mile_in_inches` and `miles_in_inches` returns the amount of inches in n miles.

```ruby
3.miles_in_inches #=> 190080
```

####Millenniums in Seconds:####
`millennium_in_seconds` and `millenniums_in_seconds` returns the amount of seconds in n millenniums.

```ruby
3.millenniums_in_seconds #=> 94672800000.0
```

####Milligrams in Grams:####
`milligram_in_grams` and `milligrams_in_grams` returns the amount of grams in n milligrams.

```ruby
3.milligrams_in_grams #=> 0.003
```

####Millimeters in Meters:####
`millimeter_in_meters` and `millimeters_in_meters` returns the amount of meters in n millimeters.

```ruby
3.millimeters_in_meters #=> 0.003
```

####Minutes in Seconds:####
`minute_in_seconds` and `minutes_in_seconds` returns the amount of seconds in n minutes.

```ruby
3.minutes_in_seconds #=> 180
```

####Multiply:####
`multiply` returns the multiplication of two numbers.

```ruby
4.multiply(2) #=> 8
```

####Multiple Of:####
`multiple_of?` returns true if a number can be evenly divided by n.

```ruby
9.multiple_of?(3) #=> true
7.multiple_of?(3) #=> false
```

####Nautical Miles in Inches:####
`nautical_mile_in_inches` and `nautical_miles_in_inches` returns the amount of inches in n nautical miles.

```ruby
3.nautical_miles_in_inches #=> 218740.26239999998
```

####Negative:####
`negative?` returns true if a number is less than zero.

```ruby
-1.negative? #=> true
1.negative? #=> false
```

####Ordinal:####
`ordinal` returns the suffix that should be added to a number to denote the position in an ordered sequence such as 1st, 2nd, 3rd, 4th.

```ruby
'1'.ordinal  #=> 'th'
'2'.ordinal  #=> 'nd'
'3'.ordinal  #=> 'rd'
'11'.ordinal #=> 'th'
```

####Ordinalize:####
`ordinalize` transforms a number into an ordinal string used to denote the position in an ordered sequence such as 1st, 2nd, 3rd, 4th.

```ruby
'1'.ordinalize  #=> '1th'
'2'.ordinalize  #=> '2nd'
'3'.ordinalize  #=> '3rd'
'11'.ordinalize #=> '4th'
```

####Ounces in Ounces:####
`ounce_in_ounces` and `ounces_in_ounces` returns self.

```ruby
3.ounces_in_ounces #=> 48
```

####Outside:####
`outside?` returns true if n is less than start or greater than finish.

```ruby
3.outside?(4, 5) #=> true
3.outside?(3, 5) #=> false
```

####Pad:####
`pad` returns a string reprensentation of the number padded with pad_num to a specified length.

```ruby
3.pad                #=> '003'
3.pad(pad_number: 1) #=> '113'
3.pad(precision: 4)  #=> '0003'
```

####Pad Precision:####
`pad_precision` returns a string of padded after the '.' to n amount.

**Options**
 *  pad_number: 0
 *  precision: 2
 *  separator: '...'

```ruby
3.pad_precision                #=> '3.00'
3.5.pad_precision              #=> '3.50'
3.pad_precision(pad_number: 1) #=> '3.11'
```

####Petabytes in Bytes:####
`petabyte_in_bytes` and `pegabytes_in_bytes` returns the amount of bytes in n petabytes.

```ruby
3.petabytes_in_bytes #=> 3377699720527872
```

####Positive:####
`positive?` returns true if a number is greater than zero.

```ruby
1.positive? #=> true
-1.positive? #=> false
```

####Pounds in Ounces:####
`pound_in_ounces` and `pounds_in_ounces` returns the amount of ounces in n pounds.

```ruby
3.pounds_in_ounces #=> 48
```

####Power:####
`power` returns the nth power of a number.

```ruby
4.power(2) #=> 16
```

####Root:####
`root` returns the nth root of a number.

```ruby
4.root(2) #=> 2
```

####Seconds in Seconds:####
`second_in_seconds` and `seconds_in_seconds` returns self.

```ruby
3.seconds #=> 3
```

####Stones in Ounces:####
`stone_in_ounces` and `stone_in_ounces` returns the amount of ounces in n stones.

```ruby
3.stones_in_ounces #=> 672
```

####Subtract:####
`subtract` returns the difference of two numbers.

```ruby
4.subtract(2) #=> 2
```

####Terabytes in Bytes:####
`terabyte_in_bytes` and `terabytes_in_bytes` returns the amount of bytes in n terabytes.

```ruby
3.terabytes_in_bytes #=> 3298534883328
```

####To Byte:####
`to_byte_in_bytes` converts a byte size from one unit to another unit.

```ruby
1.to_byte(:byte, :byte)          #=> 1 #B
5120.to_byte(:byte, :kilobyte)   #=> 5 #MB
1.to_byte(:megabyte, :kilobyte)  #=> 1024 #KB
80.to_byte(:megabyte, :gigabyte) #=> 0.078125 #GB
```

####To Currency:####
`to_currency` converts a number to currency string.

**Options**
 *  precision: 2
 *  unit: '$'

```ruby
3.to_currency            #=> '$3.00'
3.1.to_currency          #=> '$3.10'
3.11.to_currency         #=> '$3.11'
3.11111.to_currency      #=> '$3.11'
3.to_currency(unit: '@') #=> '@3.00'
```

####To Length:####
`to_length` converts a length from one unit to another unit.

```ruby
12.to_length(:inches, :feet)         #=> 12 #IN
3000.to_length(:meters, :kilometers) #=> 3 #KM
1.to_length(:feet, :centimeters)     #=> 30.479999999999997 #CM
1.to_length(:kilometer, :yards)      #=> 1093.6138888888888 #YDS
```

####To Mass:####
`to_mass` converts a mass from one unit to another unit.

```ruby
16.to_mass(:ounces, :pounds)        #=> 1 #LB
1.to_mass(:centigrams, :milligrams) #=> 10 #MG
3.to_mass(:pound, :kilogram)        #=> 1.360776 #KG
1.to_mass(:kilograms, :pounds)      #=> 2.204625 #LB
```

####To Nearest Value:####
`to_nearest value` return the value in values that is nearest to the number.

```ruby
5.to_nearest_value([1, 3, 6, 9])           #=> 6
3.5.to_nearest_value([3.0, 3.3, 3.6, 3.9]) #=> 3.6
```

####To Percantage:####
`to_percentage` converts a number to percentage string.

**Options**
 *  precision: 2
 *  unit: '%'

```ruby
3.to_percentage            #=> '3.00%'
3.1.to_percentage          #=> '3.10%'
3.11.to_percentage         #=> '3.11%'
3.11111.to_percentage      #=> '3.11%'
3.to_percentage(unit: '@') #=> '3.00@'
```

####To Temperature:####
`to_temperature` converts a temperature from one unit to another unit.

```ruby
100.to_temperature(:celsius, :fahrenheit) #=> 212 #F
212.to_temperature(:fahrenheit, :celsius) #=> 100 #C
212.to_temperature(:fahrenheit, :kelvin)  #=> 373.15 #K
```

####To Time:####
`to_time` converts a time unit from one unit to another unit.

```ruby
120.to_time(:seconds, :mintues) #=> 2 #MIN
3.to_time(:hours, :days)        #=> 3 #DAY
2.to_time(:days, :seconds)      #=> 172800 #SEC
1825.to_time(:days, :years)     #=> 4.996577686516085 #YR
```

####Tons in Ounces:####
`ton_in_ounces` and `ton_in_ounces` returns the amount of ounces in n tons.

```ruby
3.tons_in_ounces #=> 96000
```

####Weeks in Seconds:####
`week_in_seconds` and `weeks_in_seconds` returns the amount of seconds in n weeks.

```ruby
3.weeks_in_seconds #=> 1814400
```

####Within:####
`within?` determines if another number is approximately equal within a given epsilon

```ruby
10.006.within?(10, 0.1) #=>  true
```

####Yards in Inches:####
`yard_in_inches` and `yards_in_inches` returns the amount of inches in n yards.

```ruby
3.yards_in_inches #=> 108
```

####Years in Seconds:####
`year_in_seconds` and `years_in_seconds` returns the amount of seconds in n years.

```ruby
3.years_in_seconds #=> 94672800.0
```

## Object

####Array:####
`array?` determines if an object is an array.

```ruby
[].array?              #=> true
'Awesome Sting'.array? #=> false
```

####Blank:####
`blank?` determines if an object is empty or nil.

```ruby
''.blank?              #=> true
'Awesome Sting'.blank? #=> false
```

####Boolean:####
`boolean?` determines if an object is an boolean.

```ruby
1.boolean?     #=> true
false.boolean? #=> true
'foo'.boolean? #=> false
```

####False:####
`false?` determines if an object is false.

```ruby
false.false? #=> true
true.false?  #=> false
```

####Falsey:####
`falsey?` determines if an object is false, nil, or 0.

```ruby
false.falsey? #=> true
true.falsey?  #=> false
0.falsey?     #=> true
```

####Float:####
`float?` determines if an object is a float.

```ruby
1.0.float? #=> true
1.float?   #=> false
```

####Hash:####
`hash?` determines if an object is a hash.

```ruby
{}.hash? #=> true
[].hash? #=> false
```

####Integer:####
`integer?` determines if an object is a integer.

```ruby
1.integer?   #=> true
1.0.integer? #=> false
```

####Numeric:####
`numeric?` determines if an object is numeric.

```ruby
1.numeric?     #=> true
1.0.numeric?   #=> true
'1.0'.numeric? #=> false
```

####Numeral:####
`numeral?` determines if an object's string value is numeral.

```ruby
'-32.50'.numeral? #=> true
'$2.55'.numeral?  #=> false
```

####Palindrome:####
`palindrome?` determines if an object is equal when reversed.

```ruby
'racecar'.palindrome? #=> true
12321.palindrome?     #=> true
'example'.palindrome? #=> false
12345.palindrome?     #=> false
```

####Present:####
`present?` determines if an object is not empty or nil.

```ruby
'Awesome Sting'.present? #=> true
''.present?              #=> false
```

####Range:####
`range?` determines if an object is a range.

```ruby
(1..2).range? #=> true
1.range?      #=> false
```

####Salvage:####
`salvage` returns a placeholder if object is blank?.

```ruby
' '.salvage        #=> '---'
nil.salvage('bar') #=> 'bar'
123.salvage        #=> 123
```

####String:####
`string?` determines if an object is a string.

```ruby
'foo'.string? #=> true
1.string?     #=> false
```

####Time:####
`time?` determines if an object is a time.

```ruby
Time.now.time? #=> true
'foo'.time?    #=> false
```

####True:####
`true?` determines if an object is true.

```ruby
true.true?  #=> true
false.true? #=> false
```

####Truthy:####
`truthy?` determines if an object is true or 1.

```ruby
true.truthy?  #=> true
false.truthy? #=> false
1.truthy?     #=> true
```

####Try:####
`try` and `try!` invokes the public method whose name goes as first argument just like public_send does, except that if the receiver does not respond to it the call returns nil rather than raising an exception.

```ruby
'example'.try(:upcase)      #=> 'EXAMPLE'
'example'.try(:fake_method) #=> nil
```

## Range

####Combine:####
`combine` returns two concated ranges.

```ruby
(1..3).combine(7..9) #=> [1, 2, 3, 7, 8, 9]
```

####Include With Range:####
`include_with_range?` determines if a range includes another range.

```ruby
(1..5).include?(1..5) # => true
(1..5).include?(2..3) # => true
(1..5).include?(2..6) # => false
```

####Overlaps:####
`overlaps?` determines if two ranges overlap each other.

```ruby
(1..5).overlaps?(4..6) # => true
(1..5).overlaps?(7..9) # => false
```

####Sample:####
`sample` returns a random element from the range.

```ruby
(1..5).sample # => 4
```

####Shuffle:####
`shuffle` returns a copy of a shuffled range of elements.
`shuffle!` returns a shuffled range of elements.

```ruby
(1..5).shuffle  # => [2, 5, 1, 4, 3]
(1..5).shuffle! # => [3, 4, 5, 2, 1]
```

####Within:####
`within?` determines if one range is within another.

```ruby
(1..5).within?(2..4) # => true
(1..5).within?(4..6) # => false
```

## String

####Any:####
`any?` determines if a string includes a set of string(s).

```ruby
'example string'.any?('foo')           #=> false
'example string'.any?('foo', 'string') #=> true
```

####At:####
`at` returns the characters at index position, matching string, or regex.

```ruby
'example_string'.at(0)     #=> 'e'
'example_string'.at(-2)    #=> 'n'
'example_string'.at(1..3)  #=> 'xam'
'example_string'.at('e_s') #=> 'e_s'
'example_string'.at(/ple/) #=> 'ple'
'example_string'.at(99)    #=> nil
```

####Camelize:####
`camelize` and `camelize!` transfroms a string to camelcase.

```ruby
'example_string'.camelize         #=> 'ExampleString'
'example_String'.camecase         #=> 'ExampleString'
'example_string'.camelize(:lower) #=> 'exampleString'
'example_String'.camecase(:lower) #=> 'exampleString'
```

####Classify:####
`classify` and `classify!` creates a class name from a string like Rails does for table names to models.

```ruby
'example_string'.classify      #=> 'ExampleString'
'example_string/test'.classify #=> 'ExampleString::Test'
'example_string.test'.classify #=> 'Test'
```

####Constantize:####
`constantize` converts a string in an object.

```ruby
'Example::String'.constantize #=> Class Object
```

####Dasherize:####
`dasherize` and `dasherize!` replaces underscores with dashes in the string.

```ruby
'example_string'.dasherize #=> 'example-string'
```

####Deconstantize:####
`deconstantize` and `deconstantize!` removes the rightmost segment from the constant expression in the string.

```ruby
'Example::String'.deconstantize   # => 'Example'
'::Example::String'.deconstantize # => '::Example'
'String'.deconstantize            # => ''
'::String'.deconstantize          # => ''
''.deconstantize                  # => ''
```

####Demodulize:####
`demodulize` and `demodulize!` removes the module part from the expression in the string.

```ruby
'Example::String'.demodulize #=> 'String'
'String'.demodulize          #=> 'String'
```

####Domain:####
`domain` extracts the domain name from a URL.

```ruby
'http://www.example.com/fake-page'.domain #=> 'www.example.com'
'example string'.domain                   #=> 'example string'
```

####Downcase:####
`downcase?` returns true if all characters are lowercase.

```ruby
'example'.downcase? #=> true
'Example'.downcase? #=> false
'EXAMPLE'.downcase? #=> false
```

####Ellipsize:####
`ellipsize` truncate a string in the middle.

**Options**
 *  offset: 4
 *  separator: '...'

```ruby
'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'.ellipsize(30)                   #=> '0123...WXYZ'
'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'.ellipsize(50)                   #=> '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'.ellipsize(30, offset: 2)        #=> '01...YZ'
'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'.ellipsize(30, separator: '+++') #=> '0123+++WXYZ'
```

####Exclude:####
`exclude?` returns true if the string does not include the other string.

```ruby
'example_string'.exclude?('exa') #=> false
'example_string'.exclude?('xxx') #=> true
```

####First:####
`first` returns the first character. If a limit is supplied, returns a substring from the beginning of the string until it reaches the limit value. If the given limit is greater than or equal to the string length, returns a copy of self.

```ruby
'example'.first    #=> 'e'
'example'.first(0) #=> ''
'example'.first(3) #=> 'exa'
```

####Format:####
`format` returns an interpolated string that allows for options.

```ruby
'example %s'.format('string')                              #=> 'example string'
'test %{one} %{two}'.format(one: 'example', two: 'string') #=> 'test example string'
'%d + %d'.format([1, 2])                                   #=> '1 + 2'
```

####From:####
`from` returns a substring from the given position to the end of the string. If the position is negative, it is counted from the end of the string.

```ruby
'example'.from(0) #=> 'example'
'example'.from(3) #=> 'mple'
```

####Humanize:####
`humanize` and `humanize!` transforms a string to a human readable string.

**Options**
 *  capitalize: true

```ruby
'ExampleString'.humanize                     #=> 'Example string'
'_example_string_id'.humanize                #=> 'Example string'
'example_string'.humanize(capitalize: false) #=> 'example string'
```

####Indent:####
`indent` and `indent!` indents the lines in the receiver.

```ruby
'example'.indent(2)       #=> '  example'
'example'.indent(2, '\t') #=> '\t\texample'
```

####Index all:####
`index_all` returns the index values of matching patterns.

```ruby
'012324507654301243'.index_all(0)                           #=> [0,7,13]
'the apple is the best fruit in the world'.index_all('the') #=> [0,13,31]
'asdfasdfasdf'.index_all(/sd/)                              #=> [1,5,9]
```

####Labelize:####
`labelize` and `labelize!` transforms a string to a human readable string.

```ruby
'example string'.labelize     #=> 'Example string'
'_example_string_id'.labelize #=> 'Example string ID'
'ExampleString'.labelize      #=> 'Example string'
```

####Last:####
`last` returns the last character of the string. If a limit is supplied, returns a substring from the end of the string until it reaches the limit value (counting backwards). If the given limit is greater than or equal to the string length, returns a copy of self.

```ruby
'example'.last     #=> 'e'
'example'.last(0)  #=> ''
'example'.first(3) #=> 'ple'
```

####Mixcase:####
`mixcase?` returns true if characters are mixedcase.

```ruby
'Example'.mixedcase? #=> true
'EXAMPLE'.mixedcase? #=> false
'example'.mixedcase? #=> false
```

####Ordinal:####
`ordinal` returns the suffix that should be added to a number to denote the position in an ordered sequence such as 1st, 2nd, 3rd, 4th.

```ruby
'1'.ordinal  #=> 'th'
'2'.ordinal  #=> 'nd'
'3'.ordinal  #=> 'rd'
'11'.ordinal #=> 'th'
```

####Ordinalize:####
`ordinalize` transforms a number into an ordinal string used to denote the position in an ordered sequence such as 1st, 2nd, 3rd, 4th.

```ruby
'1'.ordinalize  #=> '1th'
'2'.ordinalize  #=> '2nd'
'3'.ordinalize  #=> '3rd'
'11'.ordinalize #=> '4th'
```

####Parameterize:####
`parameterize` and `parameterize!` makes string suitable for a dashed url parameter string.

```ruby
'example_string'.parameterize      #=> 'example-string'
'example_string'.parameterize('?') #=> 'example?string'
```

####Pollute:####
`pollute` and `pollute!` pollutes the space between every letter in a string, so it will be exempt from any impending string searches.

```ruby
'test'.pollute      #=> 't^--^--^e^--^--^s^--^--^t^--^--^'
'test'.pollute('-') #=> 't-e-s-t-'
```

####Pop:####
`pop` returns the last character of a string.

```ruby
'test'.pop #=> 't'
```

####Push:####
`push` concats string to self.

```ruby
'test'.push('er') #=> 'tester'
```

####Remove:####
`remove` and `remove!` removes every instance of a string.

```ruby
'this thing that thing'.remove('thing')        #=> 'this  that '
'this thing that thing'.remove(1..3)           #=> 't thing that thing'
'this thing that them'.remove('thing', 'them') #=> 'this  that '
'this thing that them'.remove('thing', 1..3)   #=> 't  that them'
```

####Remove Tags:####
`remove_tags` and `remove_tags!` removes HTML tags from a string.

```ruby
'example'.strip_tags                                   #=> 'example'
'<a href='http://example.com'>click</a>'.strip_tags    #=> 'click'
'this is <b>bold</b> and <em>emphatic</em>'.strip_tags #=> 'this is bold and emphatic'
```

####Sample:####
`sample` and `sample!` deletes a random value and returns that value.

```ruby
'this thing that'.sample            #=> 'thing'
'this thing that'.sample(' thing ') #=> 'that'
```

####Shift:####
`shift` and `shift!` removes the first instance of a string.

```ruby
'this thing that thing'.shift                 #=> 't'
'this thing that thing'.shift('thing')        #=> 'this  that thing'
'this thing that thing'.shift('this', 'that') #=> ' thing  thing'
```

####Shuffle:####
`shuffle` and `shuffle!` randomizes the characters in a string.

```ruby
'ruby rules'.sample  #=> 'e lybrsuur'
'ruby rules'.sample! #=> 'rblse syru'
```

####Sift:####
`sift` and `sift!` returns a string matching any character in a pattern.

```ruby
'qa2ws3ed4rf5tg6yh7uj8ik9ol'.sift('0123456789')          #=> '23456789'
'qa2ws3ed4rf5tg6yh7uj8ik9ol'.sift(0..9)                  #=> '23456789'
'qa2ws3ed4rf5tg6yh7uj8ik9ol'.sift([0,1,2,3,4,5,6,7,8,9]) #=> '23456789'
```

####Slugify:####
`slugify` and `slugify!` generates a permalink-style string, with odd characters removed.

```ruby
'example'.slugify                  #=> 'example'
'example string'.slugify           #=> 'example-string'
'Example string @@@ test!'.slugify #=> 'example-string-test'
```

####Sort:####
`sort` and `sort!` sorts a string.

```ruby
'adbec'.sort #=> 'abcde'
```

####Squish:####
`squish` and `squish!` returns the string, first removing all whitespace on both ends of the string, and then changing remaining consecutive whitespace groups into one space each.

```ruby
'example    string'.squish        #=> 'example string'
'example  \n   \t  string'.squish #=> 'example string'
'   example    string   '.squish  #=> 'example string'
```

####Titleize:####
`titleize` and `titleize!` capitalizes each word in a string.

```ruby
'example string'.titleize     #=> 'Example String'
'_example_string_id'.titleize #=> 'Example String'
'ExampleString'.titleize      #=> 'Example String'
```

####To:####
`to` returns a substring from the beginning of the string to the given position. If the position is negative, it is counted from the end of the string.

```ruby
'example'.to(0)  #=> 'example'
'example'.to(3)  #=> 'exam'
'example'.to(-2) #=> 'exampl'
```

####Truncate:####
`truncate` a given text after a given length if text is longer than length.

**Options**
 *  omission: '...'
 *  separator: ' '

```ruby
'example string'.truncate(3)                          #=> '...'
'example string'.truncate(6)                          #=> 'exa...'
'example string'.truncate(12, separator: ' ')         #=> 'example...'
'example string'.truncate(13, omission: '... (more)') #=> 'exa... (more)'
'example string'.truncate(15)                         #=> 'example string'
```

####Truncate Words:####
`truncate_words` truncates a given text after a given number of words.

**Options**
 *  omission: '...'
 *  separator: ' '

```ruby
'example string test'.truncate_words(1)                                                                #=> 'example...'
'Once<br>upon<br>a<br>time<br>in<br>a<br>world'.truncate_words(5, separator: '<br>')                   #=> 'Once<br>upon<br>a<br>time<br>in...'
'And they found that many people were sleeping better.'.truncate_words(5, omission: '... (continued)') #=> 'And they found that many... (continued)'
```

####Underscore:####
`underscore` and `underscore!` transforms a string to snakecase.

```ruby
'ExampleString'.underscore       #=> 'example_string'
'exampleString'.underscore       #=> 'example_string'
'ExampleString::Test'.underscore #=> 'example_string/test'
```

####Unpollute:####
`unpollute` and `unpollute!` removes the default or custom pollution character. Can also be used to remove an unwanted character.

```ruby
't^--^--^e^--^--^s^--^--^t^--^--^'.unpollute #=> 'test'
't-e-s-t-'.unpollute                         #=> 'test'
```

####Upcase:####
`upcase?` returns true if all characters are uppercase.

```ruby
'EXAMPLE'.upcase? #=> true
'example'.upcase? #=> false
'Example'.upcase? #=> false
```

####Unshift:####
`unshift` and `unshift!` prepends string(s) to self.

```ruby
'this thing that thing'.unshift('thing ')         #=> 'thing this thing that thing'
'this thing that thing'.unshift('this ', 'that ') #=> 'this that this thing that thing'
```

## Time

*Note:* also works with Date class.

####Format:####
`format` converts a Date or Time object to format it using a human readable string.

**Rules**
 *  Characters: a-z 0-9 _
 *  Characters can only be used to generate a format part

```ruby
Date.today.format('year')                                #=> '2014'
Time.now.format('month_name day, year hour:minute ampm') #=> 'January 09, 2014 02:31 pm'
```

| Name | Key | Equivalent `strftime` | Result |
| --- | --- | --- | --- |
| Month - digits zero-padded | `m` or `month` or `month_padded` | %m | (01..12) |
| Month - digits unpadded | `mm` or `Month` or `month_unpadded` | %-m | (1..12) |
| Month - digits blank-padded | `mmm` or `MONTH` or `day_blank` | %_m | ( 1..12) |
| Month - name | `mmmm` or `month_name` | %B | January |
| Month - name abbreviated | `mmmmm` or `month_name_abbr` | %b | Jan |
| Day - digits zero-padded | `d` or `day` or `day_padded` | %d | (01..31) |
| Day - digits unpadded | `dd` or `Day` or `day_unpadded` | %-d | (1..31) |
| Day - digits blank-padded | `ddd` or `DAY` or `day_blank` | %_d | ( 1..31) |
| Day - digits of the year | `dddd` or `day_of_the_year` | %j | (001..366) |
| Week - starting monday | `wwwww` or `week` | %M | (00..53) |
| Week - starting sunday | `wwwwww` or `weekday_offset` | %M | (00..53) |
| Weekday - starting monday | `w` or `weekday` | %M | (1..7) |
| Weekday - starting sunday | `ww` or `weekday` | %M | (0..6) |
| Weekday - name | `www` or `weekday_name` | %M | Sunday |
| Weekday - name abbreviated | `wwww` or `weekday_name_abbr` | %M | Sun |
| Year - digits two | `yy` or `yr` | %y | (00..99) |
| Year - digits four | `yyyy` or `year` | %Y | 1999 |
| Hour - digits zero-padded | `h` or `hour` or `hour_padded` | %H | (00..23) |
| Hour - digits blank-padded | `hh` or `HOUR` or `hour_blank` | %k | ( 0..23) |
| Hour - digits zero-padded | `hhh` or `hour_imperical` or `hour_imperical_padded` | %I | (01..12) |
| Hour - digits blank-padded | `hhhh` or `HOUR_IMPERICAL` or `hour_imperical_blank` | %l | ( 1..12) |
| Minute - minute | `n` or `minute` | %M | (00..59) |
| Second - second | `s` or `second` | %S | (00..60) |
| Meridian - lowercase | `ampm` or `meridian` | %p | am..pm |
| Meridian - uppercase | `AMPM` or `MERIDIAN` | %P | AM..PM |
| Time Zone - time zone | `z` or `time_zone` | %z | +0900 |
| Time Zone - hour and minute offset | `zz` or `time_zone_offset` | %z | +09:00 |
| Time Zone - hour, minute and second offset | `zzz` or `time_zone_offset_full` | %z | +09:00:00 |

####To Format / Stamp:####
`to_format` and `stamp` converts a Date or Time object to a predefined format.

**For a full list check out the time extention file.**

```ruby
Time.now.to_format(:year) #=> '2014'
Time.now.stamp(:datetime) #=> 'January 09, 2014 02:31 pm'
```

| Name | Key | Equivalent `strftime` | Result |
| --- | --- | --- | --- |
| Month - digits zero-padded | `:month` or `:month_padded` | %A | (01..12) |
| Month - digits unpadded | `:month_unpadded` | %a | (1..12) |
| Month - digits blank-padded | `:month_blank` | %a | ( 1..12) |
| Month - name | `:month_name` | %A | January |
| Month - name abbreviated | `:month_name_abbr` | %a | Jan |
| Month - digits zero-padded | `:month_year` or `:month_padded_year` | %A | (01..12) 2015 |
| Month - digits unpadded | `:month_unpadded_year` | %a | (1..12) 2015 |
| Month - digits blank-padded | `:month_blank_year` | %a | ( 1..12) 2015 |
| Month - name | `:month_name_year` | %A | January 2015 |
| Month - name abbreviated | `:month_name_abbr_year` | %a | Jan 2015 |
| Weekday - digits zero-padded | `:weekday_padded` | %A | (01..31) |
| Weekday - digits unpadded | `:weekday_unpadded` | %a | (1..31) |
| Weekday - digits blank-padded | `:weekday_blank` | %a | ( 1..31) |
| Weekday - name | `:weekday_name` | %A | Sunday |
| Weekday - name abbreviated | `:weekday_name_abbr` | %a | Sun |
| Year - digits two | `:yr` | %y | (00..99) |
| Year - digits four | `:year` | %Y | 1999 |
| Hour - digits zero-padded | `:hour` or `:hour_padded` | %H | (00..23) |
| Hour - digits blank-padded | `:hour_blank` | %k | ( 0..23) |
| Hour - digits zero-padded imperical | `:hour_imperical_padded` | %I | (01..12) |
| Hour - digits blank-padded imperical | `:hour_imperical_blank` | %l | ( 1..12) |
| Minute - minute | `:minute` | %M | (00..59) |
| Second - second | `:second` | %S | (00..60) |
| Time Zone - time zone | `:time_zone` | %z | +0900 |
| Time Zone - hour and minute offset | `:time_zone_offset` | %z | +09:00 |
| Time Zone - hour, minute and second offset | `:time_zone_offset_full` | %z | +09:00:00 |
| Date - name | `:date` | %B %-d, %Y | January 9, 2014 |
| Date - name abbreviated | `:date_abbr` | %b %-d, %Y | Jan 9, 2014 |
| Date - iso | `:date_iso` | %Y-%m-%d | 2014-01-09 |
| Datetime - name | `:datetime` | %B %-d, %Y %H:%M | January 9, 2014 00:31 |
| Datetime - name abbreviated | `:datetime_abbr` | %b %-d, %Y %H:%M | Jan 9, 2014 00:31 |
| Datetime - iso | `:datetime_iso` | %Y-%m-%d %H:%M | 2014-01-09 00:31 |
| Datetime - name imperical | `:datetime_imperical` | %B %-d, %Y %H:%M | January 9, 2014 12:31 am |
| Datetime - name abbreviated imperical | `:datetime_imperical_abbr` | %b %-d, %Y %H:%M | Jan 9, 2014 12:31 am |
| Datetime - iso imperical | `:datetime_imperical_iso` | %Y-%m-%d %H:%M | 2014-01-09 12:31 am |
| Datetime - name time zone | `:datetime_tzn` | %B %-d, %Y %H:%M %Z | January 9, 2014 00:31 UTC |
| Datetime - name abbreviated time zone | `:datetime_abbr_tzn` | %b %-d, %Y %H:%M %Z | Jan 9, 2014 00:31 UTC |
| Datetime - iso time zone | `:datetime_iso_tzn` | %Y-%m-%d %H:%M %z | 2014-01-09 00:31 +0000 |
| Datetime - name imperical time zone | `:datetime_imperical_tzn` | %B %-d, %Y %H:%M %Z | January 9, 2014 12:31 am UTC |
| Datetime - name abbreviated imperical time zone | `:datetime_imperical_abbr_tzn` | %b %-d, %Y %H:%M %Z | Jan 9, 2014 12:31 am UTC |
| Datetime - iso imperical time zone | `:datetime_imperical_iso_tzn` | %Y-%m-%d %H:%M %z | 2014-01-09 12:31 am +0000 |
| Day - name | `:day` | %B %-d | January 9 |
| Day - name abbreviated | `:day_abbr` | %b %-d | Jan 9 |
| Day - iso | `:day_iso` | %m-%d | 01-09 |
| Daytime - name | `:daytime` | %B %-d %H:%M | January 9 00:31 |
| Daytime - name abbreviated | `:daytime_abbr` | %b %-d %H:%M | Jan 9 00:31 |
| Daytime - iso | `:daytime_iso` | %m-%d %H:%M | 01-09 00:31 |
| Daytime - name imperical | `:daytime_imperical` | %B %-d %H:%M | January 9 12:31 am |
| Daytime - name abbreviated imperical | `:daytime_imperical_abbr` | %b %-d %H:%M | Jan 9 12:31 am |
| Daytime - iso imperical | `:daytime_imperical_iso` | %m-%d %H:%M | 01-09 12:31 am |
| Time - zero-padded | `:time` or `:time_padded` | %H:%M | 00:31 |
| Time - blank-padded | `:time_blank` | %k:%M %z | 0:31 |
| Time - zero-padded imperical | `:time_imperical` or `:time_imperical_padded` | %I:%M %P | 07:31 |
| Time - blank-padded imperical | `:time_imperical_blank` | %l:%M %P | 7:31 |
| Time - with time zone | `:time_tz` | %H:%M %z | 00:31 +0000 |
| Time - with time zone name | `:time_tzn` | %H:%M %Z | 00:31 UTC |

## Contributing

Your contribution is welcome.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
