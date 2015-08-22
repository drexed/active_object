class Object

  unless defined?(Rails)
    def blank?
      object = self
      object = object.strip if respond_to?(:strip)
      respond_to?(:empty?) ? !!object.empty? : !object
    end
  end

  def numeric?
    !to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/).nil?
  end

  def palindrome?
    to_s == to_s.reverse
  end

  unless defined?(Rails)
    def present?
      !blank?
    end
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