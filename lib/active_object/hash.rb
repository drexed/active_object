module ActiveObject::Hash

  def assert_valid_keys(*valid_keys)
    valid_keys.flatten!

    each_key do |key|
      next if valid_keys.include?(key)

      raise ArgumentError,
            "Unknown key: #{key.inspect}. Valid keys are: #{valid_keys.map(&:inspect).join(', ')}"
    end
  end

  def assert_valid_keys!(*valid_keys)
    if empty?
      raise ArgumentError,
            "Empty hash. Valid keys are: #{valid_keys.map(&:inspect).join(', ')}"
    else
      assert_valid_keys(*valid_keys)
    end
  end

  def compact
    select { |_, val| !val.nil? }
  end

  def compact!
    reject! { |_, val| val.nil? }
  end

  def deep_merge(other_hash, &block)
    dup.deep_merge!(other_hash, yield(block))
  end

  # rubocop:disable Metrics/MethodLength
  def deep_merge!(other_hash, &block)
    other_hash.each_pair do |current_key, other_value|
      this_value = self[current_key]

      self[current_key] = if this_value.is_a?(Hash) && other_value.is_a?(Hash)
                            this_value.deep_merge(other_value, yield(block))
                          elsif block_given? && key?(current_key)
                            yield(current_key, this_value, other_value)
                          else
                            other_value
                          end
    end

    self
  end
  # rubocop:enable Metrics/MethodLength

  def dig(key, *rest)
    value = (self[key] rescue nil)

    return if value.nil?
    return value if rest.empty?
    return value.dig(*rest) if value.respond_to?(:dig)
  end

  def except(*keys)
    dup.except!(*keys)
  end

  def except!(*keys)
    keys.flatten.each { |key| delete(key) }
    self
  end

  def hmap(&block)
    dup.hmap!(&block)
  end

  # rubocop:disable Lint/UnusedMethodArgument
  def hmap!(&block)
    inject({}) { |hash, (key, val)| hash.merge(yield(key, val)) }
  end
  # rubocop:enable Lint/UnusedMethodArgument

  def nillify
    dup.nillify!
  end

  def nillify!
    each { |key, val| self[key] = nil if !val.nil? && (val.try(:blank?) || val.try(:to_s).blank?) }
  end

  def only(*keys)
    dup.only!(*keys)
  end

  def only!(*keys)
    hash = {}
    keys.flatten.each { |key| hash[key] = self[key] if key?(key) }
    replace(hash)
  end

  def rename_keys(*keys)
    dup.rename_keys!(*keys)
  end

  def rename_keys!(*keys)
    keys = Hash[*keys.flatten]
    keys.each { |key, val| self[val] = delete(key) if self[key] }
    self
  end

  def reverse_merge(other_hash)
    other_hash.merge(self)
  end

  def reverse_merge!(other_hash)
    replace(reverse_merge(other_hash))
  end

  def sample
    key = sample_key
    [key, fetch(key)]
  end

  def sample!
    key, value = sample
    delete(key)
    [key, value]
  end

  def sample_key
    hash_keys = keys
    hash_keys.at(Random.rand(hash_keys.length - 1))
  end

  def sample_key!
    key, = sample
    delete(key)
    key
  end

  def sample_value
    fetch(sample_key)
  end

  def sample_value!
    key, value = sample
    delete(key)
    value
  end

  def shuffle
    Hash[to_a.sample(length)]
  end

  def shuffle!
    replace(shuffle)
  end

  def slice(*keys)
    keys.flatten
        .each_with_object(self.class.new) { |key, hsh| hsh[key] = self[key] if key?(key) }
  end

  def slice!(*keys)
    omit = slice(*self.keys - keys)
    hash = slice(*keys)

    hash.default = default
    hash.default_proc = default_proc if default_proc

    replace(hash)
    omit
  end

  def stringify_keys
    dup.stringify_keys!
  end

  def stringify_keys!
    each_with_object({}) { |(key, val), options| options[key.to_s] = val }
  end

  def strip
    select { |_, val| !val.blank? }
  end

  def strip!
    reject! { |_, val| val.blank? }
  end

  def symbolize_keys
    dup.symbolize_keys!
  end

  def symbolize_keys!
    each_with_object({}) { |(key, val), options| options[(key.to_sym rescue key) || key] = val }
  end

  def symbolize_and_underscore_keys
    dup.symbolize_and_underscore_keys!
  end

  def symbolize_and_underscore_keys!
    each_with_object({}) do |(key, val), options|
      options[(key.to_s.tr(' ', '_').underscore.to_sym rescue key) || key] = val
    end
  end

  def transform_keys(&block)
    dup.transform_keys!(&block)
  end

  # rubocop:disable Lint/UnusedMethodArgument
  def transform_keys!(&block)
    return(enum_for(:transform_keys!)) unless block_given?

    each_key { |key| self[yield(key)] = delete(key) }
    self
  end
  # rubocop:enable Lint/UnusedMethodArgument

  def transform_values(&block)
    dup.transform_values!(&block)
  end

  # rubocop:disable Lint/UnusedMethodArgument
  def transform_values!(&block)
    return(enum_for(:transform_values!)) unless block_given?

    each { |key, val| self[key] = yield(val) }
  end
  # rubocop:enable Lint/UnusedMethodArgument

end

Hash.include(ActiveObject::Hash) if ActiveObject::Settings.config.autoload_hash
