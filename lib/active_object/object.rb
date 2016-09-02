module ActiveObject::Object
  FALSE_VALUES = [false, 0, '0', 'false', 'FALSE', 'f', 'F']
  TRUE_VALUES = [true, 1, '1', 'true', 'TRUE', 't', 'T']

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

  def false?
    self == false
  end

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

  def salvage(placeholder='---')
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
    TRUE_VALUES.include?(self)
  end

  def try(*a, &b)
    try!(*a, &b) if a.empty? || respond_to?(a.first)
  end

  def try!(*a, &b)
    if a.empty? && block_given?
      b.arity.zero? ? instance_eval(&b) : yield(self)
    else
      public_send(*a, &b)
    end
  end

end

Object.send(:include, ActiveObject::Object) if ActiveObject::Settings.config.autoload_object
