# frozen_string_literal: true

module ActiveObject
  module Array

    def after(value)
      return unless include?(value)

      self[(index(value).to_i + 1) % length]
    end

    def before(value)
      return unless include?(value)

      self[(index(value).to_i - 1) % length]
    end

    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength, Metrics/PerceivedComplexity,
    # rubocop:disable Style/GuardClause, Style/IfInsideElse
    def bury(*args)
      if args.count < 2
        raise ArgumentError, '2 or more arguments required'
      elsif args.count == 2
        if args[0].is_a?(Integer)
          self[args[0]] = args[1]
        else
          self << { args[0] => args[1] }
        end
      else
        if args[0].is_a?(Integer)
          arg = args.shift

          self[arg] = [] unless self[arg]
          self[arg].bury(*args)
        else
          self << {}.bury(*args)
        end
      end

      self
    end
    # rubocop:enable Style/GuardClause, Style/IfInsideElse
    # rubocop:enable Metrics/AbcSize, Metrics/MethodLength, Metrics/PerceivedComplexity

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
      args.each_with_object([]) { |val, results| results << delete(val) }
    end

    def demote(value)
      sort_by { |val| val == value ? 0 : -1 }
    end

    def demote!(value)
      replace(demote(value))
    end

    def denillify(value = 0)
      map { |val| val.nil? ? value : val }
    end

    def denillify!(value = 0)
      replace(denillify(value))
    end

    def dig(key, *rest)
      value = (self[key] rescue nil)

      return if value.nil?
      return value if rest.empty?
      return value.dig(*rest) if value.respond_to?(:dig)
    end

    def duplicates(minimum = 2)
      hash = ::Hash.new(0)
      each { |val| hash[val] += 1 }
      hash.delete_if { |_, val| val < minimum }.keys
    end

    def from(position)
      self[position, length] || []
    end

    def fulfill(value, amount)
      return self if amount <= length

      fill(value, length..(amount - 1))
    end

    def groups(number)
      return [] if number <= 0

      num, rem = length.divmod(number)
      collection = (0..(num - 1)).collect { |val| self[(val * number), number] }
      rem.positive? ? collection << self[-rem, rem] : collection
    end

    # rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/AbcSize
    def in_groups(number, fill_with = nil)
      collection_length = length
      division = collection_length.div(number)
      modulo = collection_length % number

      collection = []
      start = 0
      number.times do |int|
        mod_gt_zero = modulo.positive?
        grouping = division + (mod_gt_zero && modulo > int ? 1 : 0)
        collection << last_group = slice(start, grouping)
        last_group << fill_with if fill_with != false && mod_gt_zero && grouping == division
        start += grouping
      end

      block_given? ? collection.each { |val| yield(val) } : collection
    end
    # rubocop:enable Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    def in_groups_of(number, fill_with = nil)
      if number.to_i <= 0
        raise ArgumentError,
              "Group length must be a positive integer, was #{number.inspect}"
      end

      if fill_with == false
        collection = self
      else
        padding = (number - length % number) % number
        collection = dup.concat(::Array.new(padding, fill_with))
      end

      sliced_collection = collection.each_slice(number)
      block_given? ? sliced_collection { |val| yield(val) } : sliced_collection.to_a
    end
    # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

    def indexes(value)
      results = []
      each_with_index { |val, i| results << i if value == val }
      results
    end

    def merge(*values)
      values.each { |val| concat(val) }
      self
    end

    def nillify
      map { |val| !val.nil? && (val.try(:blank?) || val.try(:to_s).blank?) ? nil : val }
    end

    def nillify!
      replace(nillify)
    end

    def position(value)
      idx = index(value)
      return if idx.nil?

      idx + 1
    end

    def positions(value)
      indexes(value).map { |val| val + 1 }
    end

    def probability
      hash = ::Hash.new(0.0)
      differ = 0.0

      each do |val|
        hash[val] += 1.0
        differ += 1.0
      end

      hash.each_key { |val| hash[val] /= differ }
      hash
    end

    def promote(value)
      sort_by { |val| val == value ? -1 : 0 }
    end

    def promote!(value)
      replace(promote(value))
    end

    def reject_values(*args)
      reject { |val| args.include?(val) }
    end

    def rposition(value)
      idx = rindex(value)
      return if idx.nil?

      idx + 1
    end

    def sample!
      delete_at(::Random.rand(length - 1))
    end

    # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    def split(number = nil)
      if block_given?
        each_with_object([[]]) do |element, results|
          yield(element) ? (results << []) : (results.last << element)
        end
      else
        results = [[]]
        arr = dup

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
    # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

    def strip
      reject(&:blank?)
    end

    def strip!
      replace(strip)
    end

    def swap(from, to)
      self[from], self[to] = self[to], self[from]
      self
    end

    def to(position)
      position >= 0 ? first(position + 1) : self[0..position]
    end

    # rubocop:disable Metrics/MethodLength
    def to_sentence(options = {})
      options = {
        words_connector: ', ',
        two_words_connector: ' and ',
        last_word_connector: ', and '
      }.merge!(options)

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
    # rubocop:enable Metrics/MethodLength

  end
end

Array.include(ActiveObject::Array) if ActiveObject.configuration.autoload_array
