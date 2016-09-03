module Enumerable

  def cluster(&block)
    result = []
    each do |ele|
      if result.last && (yield(result.last.last) == yield(ele))
        result.last << ele
      else
        result << [ele]
      end
    end
    result
  end

  def difference(identity = 0, &block)
    if block_given?
      map(&block).difference(identity)
    else
      inject { |key, val| key - val } || identity
    end
  end

  def divisible(identity = 0, &block)
    if block_given?
      map(&block).divisible(identity)
    else
      inject { |key, val| key / val } || identity
    end
  end

  def drop_last(num)
    collection_length = to_a.length

    return(self) if num > collection_length

    self[0...(collection_length - num)]
  end

  def drop_last_if
    return(to_enum(:drop_last_if)) unless block_given?

    result = []
    dropping = true
    reverse_each do |val|
      result.unshift(val) unless dropping &&= yield(val)
    end
    result
  end

  def exactly?(num)
    found_count = 0
    block_given? ? each { |*opt| found_count += 1 if yield(*opt) } : each { |opt| found_count += 1 if opt }
    (found_count > num) ? false : num == found_count
  end

  def exclude?(object)
    !include?(object)
  end

  def expand
    map { |val| val.is_a?(Enumerable) ? val.expand : val }
  end

  def exponential(identity = 0, &block)
    if block_given?
      map(&block).exponential(identity)
    else
      inject { |key, val| key ** val } || identity
    end
  end

  def frequencies
    each_with_object(Hash.new(0)) { |key, hsh| hsh[key] += 1 }
  end

  def incase?(object)
    any? { |val| object === val }
  end

  def many?
    found_count = 0
    if block_given?
      any? do |val|
        found_count += 1 if yield val
        found_count > 1
      end
    else
      any? { (found_count += 1) > 1 }
    end
  end

  def max(identity = 0)
    (length rescue count) > 0 ? sort.last : identity
  end

  def min(identity = 0)
    (length rescue count) > 0 ? sort.first : identity
  end

  def mean(identity = 0)
    return(identity) unless length > 0

    collection_length = length
    sum.to_f / collection_length.to_f
  end

  alias_method :average, :mean

  def median(identity = 0)
    collection_length = length.to_f
    collection_sorted = sort

    return(identity) unless collection_length > 0.0

    if (collection_length % 2).zero?
      (collection_sorted[(collection_length / 2.0) -1.0] + collection_sorted[collection_length / 2.0]) / 2.0
    else
      collection_sorted[collection_length / 2.0]
    end
  end

  def mode(identity = 0)
    return(identity) unless length > 0

    frequency_distribution = inject(Hash.new(0)) { |hsh, val| hsh[val] += 1; hsh }
    frequency_top_two = frequency_distribution.sort_by { |_, val| -val }.take(2)

    if frequency_top_two.length == 1
      frequency_top_two.first.first
    elsif frequency_top_two.first.last == frequency_top_two.last.last
      nil
    else
      frequency_top_two.first.first
    end
  end

  def multiple(identity = 0, &block)
    if block_given?
      map(&block).multiple(identity)
    else
      inject { |key, val| key * val } || identity
    end
  end

  def range(identity = 0)
    return(identity) unless length > 0

    collection_sorted = sort
    collection_sorted.last - collection_sorted.first
  end

  def several?
    found_count = 0
    block_given? ? each { |*opt| found_count += 1 if yield(*opt) } : each { |opt| found_count += 1 if opt }
    (found_count > 1) ? true : false
  end

  def standard_deviation(identity=0)
    return(identity) if length < 2

    Math.sqrt(variance)
  end

  def sum(identity = 0, &block)
    if block_given?
      map(&block).sum(identity)
    else
      inject { |sum, val| sum + val } || identity
    end
  end

  def take_last(num)
    collection_length = to_a.length

    return(self) if num > collection_length

    self[(collection_length - num)..-1]
  end

  def take_last_if
    return(to_enum(:take_last_if)) unless block_given?

    result = []
    reverse_each { |val| yield(val) ? result.unshift(val) : break }
    result
  end

  def variance(identity = 0)
    collection_length = length

    return(identity) if collection_length <= 1

    sum = inject(0.0) { |sum, val| sum + (val - mean) ** 2.0 }
    sum.to_f / (collection_length.to_f - 1.0)
  end

end
