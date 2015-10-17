class Array

  def after(value)
    return(nil) unless include?(value)

    self[(index(value).to_i + 1) % size]
  end

  def before(value)
    return(nil) unless include?(value)

    self[(index(value).to_i - 1) % size]
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
    args.each { |v| result << delete(v) }
    return(result)
  end

  def duplicates(minimum=2)
    hash = Hash.new(0)

    each { |i| hash[i] += 1 }
    hash.delete_if { |k, v| v < minimum }.keys
  end

  unless defined?(Rails)
    def from(position)
      self[position, size] || []
    end
  end

  def groups(number)
    return([]) if number <= 0

    n, r       = size.divmod(number)
    collection = (0..(n - 1)).collect { |i| self[(i * number), number] }
    r > 0 ? collection << self[-r, r] : collection
  end

  unless defined?(Rails)
    def in_groups(number, fill_with=nil)
      collection_size = size
      division        = collection_size.div(number)
      modulo          = collection_size % number

      collection = []
      start      = 0
      number.times do |i|
        grouping = division + (modulo > 0 && modulo > i ? 1 : 0)
        collection << last_group = slice(start, grouping)
        last_group << fill_with if fill_with != false && modulo > 0 && grouping == division
        start += grouping
      end

      block_given? ? collection.each { |g| yield(g) } : collection
    end
  end

  unless defined?(Rails)
    def in_groups_of(number, fill_with=nil)
      if number.to_i <= 0
        raise ArgumentError,
          "Group size must be a positive integer, was #{number.inspect}"
      end

      if fill_with == false
        collection = self
      else
        padding    = (number - size % number) % number
        collection = dup.concat(Array.new(padding, fill_with))
      end

      block_given? ? collection.each_slice(number) { |slice| yield(slice) } : collection.each_slice(number).to_a
    end
  end

  def probability
    hash   = Hash.new(0.0)
    differ = 0.0

    each do |e|
      hash[e] += 1.0
      differ  += 1.0
    end

    hash.keys.each { |e| hash[e] /= differ }
    hash
  end

  def reject_values(*args)
    reject { |x| args.include?(x) }
  end

  def sample!
    delete_at(Random.rand(size - 1))
  end

  unless defined?(Rails)
    def split(number=nil)
      if block_given?
        inject([[]]) do |results, element|
          yield(element) ? results << [] : results.last << element
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
            results.last.concat(arr.shift(arr.size))
          end
        end
        results
      end
    end
  end

  def strip
    reject { |v| v.blank? }
  end

  def strip!
    replace(strip)
  end

  unless defined?(Rails)
    def to(position)
      position >= 0 ? first(position + 1) : self[0..position]
    end
  end

  unless defined?(Rails)
    def to_sentence(options={})
      options.assert_valid_keys(:words_connector, :two_words_connector, :last_word_connector)

      default_connectors = {
        words_connector:     ', '.freeze,
        two_words_connector: ' and '.freeze,
        last_word_connector: ', and '.freeze
      }
      options = default_connectors.merge!(options)

      case size
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

end