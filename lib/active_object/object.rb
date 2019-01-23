# frozen_string_literal: true

module ActiveObject
  module Object
    FALSE_VALUES ||= [
      false, 0, '0', 'false', 'FALSE', 'f', 'F'
    ].freeze
    TRUE_VALUES ||= [
      true, 1, '1', 'true', 'TRUE', 't', 'T'
    ].freeze

    def array?
      is_a?(Array)
    end

    def blank?
      object = self
      object = object.strip if respond_to?(:strip)
      respond_to?(:empty?) ? object.empty? : !object
    end

    def boolean?
      TRUE_VALUES.include?(self) || FALSE_VALUES.include?(self)
    end

    def date?
      is_a?(Date)
    end

    # rubocop:disable Style/YodaCondition
    def false?
      false == self
    end
    # rubocop:enable Style/YodaCondition

    def falsey?
      nil? || FALSE_VALUES.include?(self)
    end

    def float?
      is_a?(Float)
    end

    def hash?
      is_a?(Hash)
    end

    def integer?
      is_a?(Integer)
    end

    def numeral?
      !to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/).nil?
    end

    def numeric?
      is_a?(Numeric)
    end

    def palindrome?
      to_s == to_s.reverse
    end

    def present?
      !blank?
    end

    def range?
      is_a?(Range)
    end

    def safe_call
      try_call || self
    end

    def safe_send(*keys)
      try_send(*keys) || self
    end

    def salvage(placeholder = '---')
      blank? ? placeholder : self
    end

    def send_chain(*keys)
      Array(keys).inject(self) { |obj, key| obj.send(*key) }
    end

    def send_chain_if(*keys)
      Array(keys).inject(self) { |obj, key| obj.send_if(*key) }
    end

    def send_if(key, *args)
      return self unless respond_to?(key)

      send(key, *args)
    end

    def string?
      is_a?(String)
    end

    def symbol?
      is_a?(Symbol)
    end

    def time?
      is_a?(Time)
    end

    # rubocop:disable Style/YodaCondition
    def true?
      true == self
    end
    # rubocop:enable Style/YodaCondition

    def truthy?
      TRUE_VALUES.include?(self)
    end

    def try(*obj, &block)
      try!(*obj, &block) if obj.empty? || respond_to?(obj.first)
    end

    def try!(*obj, &block)
      if obj.empty? && block_given?
        block.arity.zero? ? instance_eval(&block) : yield(self)
      else
        public_send(*obj, &block)
      end
    end

    def try_call
      return unless respond_to?(:call)

      call
    end

    def try_send(*keys)
      send(*keys) rescue nil
    end

  end
end

Object.include(ActiveObject::Object) if ActiveObject.configuration.autoload_object
