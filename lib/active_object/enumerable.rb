module Enumerable

  # rubocop:disable Lint/UnusedMethodArgument
  def cluster(&block)
    result = []
    each do |ele|
      last_res = result.last
      last_res && (yield(ele) == yield(last_res.last)) ? last_res << ele : result << [ele]
    end
    result
  end
  # rubocop:enable Lint/UnusedMethodArgument

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
    return self if num > collection_length
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
    if block_given?
      each { |*opt| found_count += 1 if yield(*opt) }
    else
      each { |opt| found_count += 1 if opt }
    end
    found_count > num ? false : num == found_count
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
      inject { |key, val| key**val } || identity
    end
  end

  def frequencies
    each_with_object(Hash.new(0)) { |key, hsh| hsh[key] += 1 }
  end

  # rubocop:disable Style/CaseEquality
  def incase?(object)
    any? { |val| object === val }
  end
  # rubocop:enable Style/CaseEquality

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
    (length rescue count).positive? ? sort.last : identity
  end

  def min(identity = 0)
    (length rescue count).positive? ? sort.first : identity
  end

  def mean(identity = 0)
    return identity unless length.positive?

    collection_length = length
    sum.to_f / collection_length.to_f
  end

  alias_method :average, :mean

  def median(identity = 0)
    collection_length = length.to_f
    collection_sorted = sort

    return(identity) unless collection_length > 0.0

    half_collection = collection_length / 2.0
    sorted_collection = collection_sorted[half_collection]

    if (collection_length % 2).zero?
      (collection_sorted[half_collection - 1.0] + sorted_collection) / 2.0
    else
      sorted_collection
    end
  end

  # rubocop:disable Metrics/AbcSize
  def mode(identity = 0)
    return identity unless length.positive?

    frequency_distribution = each_with_object(Hash.new(0)) { |val, hsh| hsh[val] += 1 }
    frequency_top_two = frequency_distribution.sort_by { |_, val| -val }.take(2)
    top_two_first = frequency_top_two.first

    return if frequency_top_two.length != 1 && top_two_first.last == frequency_top_two.last.last
    top_two_first.first
  end
  # rubocop:ensable Metrics/AbcSize

  def multiple(identity = 0, &block)
    if block_given?
      map(&block).multiple(identity)
    else
      inject { |key, val| key * val } || identity
    end
  end

  def range(identity = 0)
    return identity unless length.positive?

    collection_sorted = sort
    collection_sorted.last - collection_sorted.first
  end

  def several?
    found_count = 0
    if block_given?
      each { |*opt| found_count += 1 if yield(*opt) }
    else
      each { |opt| found_count += 1 if opt }
    end
    found_count > 1 ? true : false
  end

  def standard_deviation(identity = 0)
    return identity if length < 2

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

    return self if num > collection_length

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

    return identity if collection_length <= 1

    total = inject(0.0) { |sum, val| sum + (val - mean)**2.0 }
    total.to_f / (collection_length.to_f - 1.0)
  end

end
