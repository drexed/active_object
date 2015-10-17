class Object

  def array?
    is_a?(Array)
  end

  unless defined?(Rails)
    def blank?
      object = self
      object = object.strip if respond_to?(:strip)
      respond_to?(:empty?) ? object.empty? : !object
    end
  end

  def boolean?
    [false, true, nil, 0, 1].freeze.include?(self)
  end

  def false?
    self == false
  end

  def falsey?
    [false, nil, 0].freeze.include?(self)
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

  unless defined?(Rails)
    def present?
      !blank?
    end
  end

  def range?
    is_a?(Range)
  end

  def salvage(placeholder="---")
    blank? ? placeholder : self
  end

  def string?
    is_a?(String)
  end

  def time?
    is_a?(Time)
  end

  def true?
    self == true
  end

  def truthy?
    !falsey?
  end

  unless defined?(Rails)
    def try(*a, &b)
      try!(*a, &b) if a.empty? || respond_to?(a.first)
    end
  end

  unless defined?(Rails)
    def try!(*a, &b)
      if a.empty? && block_given?
        b.arity.zero? ? instance_eval(&b) : yield(self)
      else
        public_send(*a, &b)
      end
    end
  end

end