# frozen_string_literal: true

module Enumerable

  CRITICAL_ZSCORE ||= {
    3 => 1.15,
    4 => 1.48,
    5 => 1.71,
    6 => 1.89,
    7 => 2.02,
    8 => 2.13,
    9 => 2.21,
    10 => 2.29,
    11 => 2.34,
    12 => 2.41,
    13 => 2.46,
    14 => 2.51,
    15 => 2.55,
    16 => 2.59,
    17 => 2.62,
    18 => 2.65,
    19 => 2.68,
    20 => 2.71,
    21 => 2.73,
    22 => 2.76,
    23 => 2.78,
    24 => 2.80,
    25 => 2.82,
    26 => 2.84,
    27 => 2.86,
    28 => 2.88,
    29 => 2.89,
    30 => 2.91,
    31 => 2.92,
    32 => 2.94,
    33 => 2.95,
    34 => 2.97,
    35 => 2.98,
    36 => 2.99,
    37 => 3.00,
    38 => 3.01,
    39 => 3.03,
    40 => 3.04,
    50 => 3.13,
    60 => 3.20,
    70 => 3.26,
    80 => 3.31,
    90 => 3.35,
    100 => 3.38,
    110 => 3.42,
    120 => 3.44,
    130 => 3.47,
    140 => 3.49
  }.freeze

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

  def critical_zscore(identity = nil)
    collection_length = length
    result = nil

    CRITICAL_ZSCORE.keys.sort.each do |key|
      break if key > collection_length
      result = CRITICAL_ZSCORE[key]
    end

    result || identity
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

  def mean(identity = 0)
    return identity if empty?

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

  # rubocop:disable Metrics/MethodLength
  def percentile(num, identity = 0)
    return identity unless length.positive?

    collection_sorted = sort
    rank = (num.to_f / 100) * (length + 1)

    if rank.fraction?
      truncated_rank = rank.truncate
      sample_one = collection_sorted[truncated_rank - 1]
      sample_two = collection_sorted[truncated_rank]

      (rank.fraction * (sample_two - sample_one)) + sample_one
    else
      collection_sorted[rank - 1]
    end
  end
  # rubocop:enable Metrics/MethodLength

  def range(identity = 0)
    return identity unless length.positive?

    collection_sorted = sort
    collection_sorted.last - collection_sorted.first
  end

  def reject_outliers
    cz = critical_zscore
    reject { |value| zscore(value) > cz }
  end

  def reject_outliers!
    replace(reject_outliers)
  end

  def select_outliers
    cz = critical_zscore
    select { |value| zscore(value) > cz }
  end

  def several?
    found_count = 0
    if block_given?
      each { |*opt| found_count += 1 if yield(*opt) }
    else
      each { |opt| found_count += 1 if opt }
    end
    found_count > 1
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

  def zscore(value)
    sd = standard_deviation
    return 0 if sd.zero?

    (mean - value).abs / sd
  end

end
