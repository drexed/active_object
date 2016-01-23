module Enumerable

  def cluster(&block)
    result = []

    each do |element|
      if result.last && (yield(result.last.last) == yield(element))
        result.last << element
      else
        result << [element]
      end
    end

    result
  end

  def difference(identity=0, &block)
    if block_given?
      map(&block).difference(identity)
    else
      inject { |d, v| d - v } || identity
    end
  end

  def divisible(identity=0, &block)
    if block_given?
      map(&block).divisible(identity)
    else
      inject { |d, v| d / v } || identity
    end
  end

  def drop_last(n)
    collection_length = to_a.length

    return(self) if n > collection_length

    self[0...(collection_length - n)]
  end

  def drop_last_if
    return(to_enum(:drop_last_if)) unless block_given?

    result   = []
    dropping = true
    reverse_each do |value|
      result.unshift(value) unless dropping &&= yield(value)
    end
    result
  end

  def exactly?(n)
    found_count = 0
    block_given? ? each { |*o| found_count += 1 if yield(*o) } : each { |o| found_count += 1 if o }
    (found_count > n) ? false : n == found_count
  end

  unless defined?(Rails)
    def exclude?(object)
      !include?(object)
    end
  end

  def expand
    map { |n| n.is_a?(Enumerable) ? n.expand : n }
  end

  def exponential(identity=0, &block)
    if block_given?
      map(&block).exponential(identity)
    else
      inject { |d, v| d ** v } || identity
    end
  end

  def frequencies
    each_with_object(Hash.new(0)) { |e, a| a[e] += 1 }
  end

  def incase?(object)
    any? { |x| object === x }
  end

  unless defined?(Rails)
    def many?
      found_count = 0
      if block_given?
        any? do |v|
          found_count += 1 if yield v
          found_count > 1
        end
      else
        any? { (found_count += 1) > 1 }
      end
    end
  end

  def max(identity=0)
    (length rescue count) > 0 ? sort.last : identity
  end

  def min(identity=0)
    (length rescue count) > 0 ? sort.first : identity
  end

  def mean(identity=0)
    return(identity) unless length > 0

    collection_length = length
    sum.to_f / collection_length.to_f
  end

  def median(identity=0)
    collection_length   = length.to_f
    collection_sorted = sort

    return(identity) unless collection_length > 0

    if (collection_length % 2).zero?
      (collection_sorted[(collection_length / 2.0) -1.0] + collection_sorted[collection_length / 2.0]) / 2.0
    else
      collection_sorted[collection_length / 2.0]
    end
  end

  def mode(identity=0)
    return(identity) unless length > 0

    frequency_distribution = inject(Hash.new(0)) { |h, v| h[v] += 1; h }
    frequency_top_two      = frequency_distribution.sort { |k, v| v[1] <=> k[1] }.take(2)

    if frequency_top_two.length == 1
      frequency_top_two.first.first
    elsif frequency_top_two.first.last == frequency_top_two.last.last
      nil
    else
      frequency_top_two.first.first
    end
  end

  def multiple(identity=0, &block)
    if block_given?
      map(&block).multiple(identity)
    else
      inject { |d, v| d * v } || identity
    end
  end

  def range(identity=0)
    return(identity) unless length > 0

    collection_sorted = sort
    collection_sorted.last - collection_sorted.first
  end

  def several?
    found_count = 0
    block_given? ? each { |*o| found_count += 1 if yield(*o) } : each { |o| found_count += 1 if o }
    (found_count > 1) ? true : false
  end

  def standard_deviation(identity=0)
    return(identity) if length < 2

    Math.sqrt(variance)
  end

  unless defined?(Rails)
    def sum(identity=0, &block)
      if block_given?
        map(&block).sum(identity)
      else
        inject { |s, v| s + v } || identity
      end
    end
  end

  def take_last(n)
    collection_length = to_a.length

    return(self) if n > collection_length

    self[(collection_length - n)..-1]
  end

  def take_last_if
    return(to_enum(:take_last_if)) unless block_given?

    result = []
    reverse_each { |e| yield(e) ? result.unshift(e) : break }
    result
  end

  def variance(identity=0)
    collection_length = length

    return(identity) if collection_length <= 1

    sum = inject(0.0) { |s,v| s + (v - mean) ** 2.0 }
    sum.to_f / (collection_length.to_f - 1.0)
  end

end