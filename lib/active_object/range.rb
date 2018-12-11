# frozen_string_literal: true

module ActiveObject
  module Range

    def combine(other)
      to_a.concat(other.to_a)
    end

    def include_with_range?(other)
      return include?(other) unless other.is_a?(Range)

      operator = exclude_end? && !other.exclude_end? ? :< : :<=
      include?(other.first) && other.last.send(operator, last)
    end

    def overlaps?(other)
      cover?(other.first) || other.cover?(first)
    end

    def sample
      to_a.sample
    end

    def shuffle
      to_a.shuffle
    end

    def within?(other)
      cover?(other.first) && cover?(other.last)
    end

  end
end

Range.include(ActiveObject::Range) if ActiveObject.configuration.autoload_range
