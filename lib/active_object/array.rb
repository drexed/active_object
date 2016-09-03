module ActiveObject::Array

  def after(value)
    return(nil) unless include?(value)

    self[(index(value).to_i + 1) % length]
  end

  def before(value)
    return(nil) unless include?(value)

    self[(index(value).to_i - 1) % length]
  end

  def delete_first
    self[1..-1]
  end

  def delete_first!
    replace(delete_first)
  end

  def delete_last
    self[0...-1]
  end

  def delete_last!
    replace(delete_last)
  end

  def delete_values(*args)
    result = []
    args.each { |val| result << delete(val) }
    result
  end

  def dig(key, *rest)
    if value = (self[key] rescue nil)
      if rest.empty?
        value
      elsif value.respond_to?(:dig)
        value.dig(*rest)
      end
    end
  end

  def duplicates(minimum = 2)
    hash = Hash.new(0)

    each { |val| hash[val] += 1 }
    hash.delete_if { |_, val| val < minimum }.keys
  end

  def from(position)
    self[position, length] || []
  end

  def groups(number)
    return([]) if number <= 0

    num, rem = length.divmod(number)
    collection = (0..(num - 1)).collect { |val| self[(val * number), number] }
    rem > 0 ? collection << self[-rem, rem] : collection
  end

  def in_groups(number, fill_with=nil)
    collection_length = length
    division = collection_length.div(number)
    modulo = collection_length % number

    collection = []
    start = 0
    number.times do |int|
      mod_gt_zero = modulo > 0
      grouping = division + (mod_gt_zero && modulo > int ? 1 : 0)
      collection << last_group = slice(start, grouping)
      last_group << fill_with if fill_with != false && mod_gt_zero && grouping == division
      start += grouping
    end

    block_given? ? collection.each { |val| yield(val) } : collection
  end

  def in_groups_of(number, fill_with=nil)
    if number.to_i <= 0
      raise ArgumentError,
            "Group length must be a positive integer, was #{number.inspect}"
    end

    if fill_with == false
      collection = self
    else
      padding = (number - length % number) % number
      collection = dup.concat(Array.new(padding, fill_with))
    end

    block_given? ? collection.each_slice(number) { |val| yield(val) } : collection.each_slice(number).to_a
  end

  def percentile(percentage)
    size = self.size

    if size > 1
      index = (size * percentage) / 100.0
      self.sort[index]
    else
      self.first
    end
  end

  def probability
    hash = Hash.new(0.0)
    differ = 0.0

    each do |val|
      hash[val] += 1.0
      differ += 1.0
    end

    hash.each_key { |val| hash[val] /= differ }
    hash
  end

  def reject_values(*args)
    reject { |val| args.include?(val) }
  end

  def sample!
    delete_at(Random.rand(length - 1))
  end

  def split(number=nil)
    if block_given?
      inject([[]]) do |results, element|
        yield(element) ? (results << []) : (results.last << element)
        results
      end
    else
      results, arr = [[]], dup
      until arr.empty?
        if (idx = arr.index(number))
          results.last.concat(arr.shift(idx))
          arr.shift
          results << []
        else
          results.last.concat(arr.shift(arr.length))
        end
      end
      results
    end
  end

  def strip
    reject { |val| val.blank? }
  end

  def strip!
    replace(strip)
  end

  def to(position)
    position >= 0 ? first(position + 1) : self[0..position]
  end

  def to_sentence(options={})
    default_connectors = {
      words_connector: ', ',
      two_words_connector: ' and ',
      last_word_connector: ', and '
    }
    options = default_connectors.merge!(options)

    case length
    when 0
      ''
    when 1
      self[0].to_s.dup
    when 2
      "#{self[0]}#{options[:two_words_connector]}#{self[1]}"
    else
      "#{self[0...-1].join(options[:words_connector])}#{options[:last_word_connector]}#{self[-1]}"
    end
  end

end

Array.send(:include, ActiveObject::Array) if ActiveObject::Settings.config.autoload_array
