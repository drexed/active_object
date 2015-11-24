class Hash

  unless defined?(Rails)
    def assert_valid_keys(*valid_keys)
      valid_keys.flatten!
      each_key do |k|
        unless valid_keys.include?(k)
          raise ArgumentError,
            "Unknown key: #{k.inspect}. Valid keys are: #{valid_keys.map(&:inspect).join(', '.freeze)}"
        end
      end
    end
  end

  unless defined?(Rails)
    def compact
      select { |k, v| !v.nil? }
    end
  end

  unless defined?(Rails)
    def compact!
      reject! { |k, v| v.nil? }
    end
  end

  unless defined?(Rails)
    def deep_merge(other_hash, &block)
      dup.deep_merge!(other_hash, &block)
    end
  end

  unless defined?(Rails)
    def deep_merge!(other_hash, &block)
      other_hash.each_pair do |current_key, other_value|
        this_value = self[current_key]

        self[current_key] = if this_value.is_a?(Hash) && other_value.is_a?(Hash)
          this_value.deep_merge(other_value, &block)
        else
          block_given? && key?(current_key) ? block.call(current_key, this_value, other_value) : other_value
        end
      end

      self
    end
  end

  def except(*keys)
    dup.except!(*keys)
  end

  def except!(*keys)
    keys.flatten.each { |k| delete(k) }
    self
  end

  def nillify
    dup.nillify!
  end

  def nillify!
    each { |k, v| self[k] = nil if !v.nil? && (v.try(:blank?) || v.try(:to_s).blank?) }
  end

  def only(*keys)
    dup.only!(*keys)
  end

  def only!(*keys)
    hash = {}
    keys.flatten.each { |k| hash[k] = self[k] if self.has_key?(k) }
    replace(hash)
  end

  def rename_keys(*keys)
    dup.rename_keys!(*keys)
  end

  def rename_keys!(*keys)
    keys = Hash[*keys.flatten]
    keys.each { |k, v| self[v] = delete(k) if self[k] }
    self
  end

  unless defined?(Rails)
    def reverse_merge(other_hash)
      other_hash.merge(self)
    end
  end

  unless defined?(Rails)
    def reverse_merge!(other_hash)
      replace(reverse_merge(other_hash))
    end
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
    key, value = sample
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

  unless defined?(Rails)
    def slice(*keys)
      keys.flatten.each_with_object(self.class.new) { |k, h| h[k] = self[k] if has_key?(k) }
    end
  end

  unless defined?(Rails)
    def slice!(*keys)
      omit = slice(*self.keys - keys)
      hash = slice(*keys)

      hash.default      = default
      hash.default_proc = default_proc if default_proc

      replace(hash)
      omit
    end
  end

  unless defined?(Rails)
    def stringify_keys
      dup.stringify_keys!
    end
  end

  unless defined?(Rails)
    def stringify_keys!
      inject({}) do |options, (key, value)|
        options[key.to_s] = value
        options
      end
    end
  end

  def strip
    select { |k, v| !v.blank? }
  end

  def strip!
    reject! { |k, v| v.blank? }
  end

  unless defined?(Rails)
    def symbolize_keys
      dup.symbolize_keys!
    end
  end

  unless defined?(Rails)
    def symbolize_keys!
      inject({}) do |options, (key, value)|
        options[(key.to_sym rescue key) || key] = value
        options
      end
    end
  end

  def symbolize_and_underscore_keys
    dup.symbolize_and_underscore_keys!
  end

  def symbolize_and_underscore_keys!
    inject({}) do |options, (key, value)|
      options[(key.to_s.gsub(' '.freeze, '_'.freeze).underscore.to_sym rescue key) || key] = value
      options
    end
  end

  unless defined?(Rails)
    def transform_keys(&block)
      dup.transform_keys!(&block)
    end
  end

  unless defined?(Rails)
    def transform_keys!(&block)
      return(enum_for(:transform_keys!)) unless block_given?

      keys.each { |k| self[yield(k)] = delete(k) }
      self
    end
  end

  unless defined?(Rails)
    def transform_values(&block)
      dup.transform_values!(&block)
    end
  end

  unless defined?(Rails)
    def transform_values!(&block)
      return(enum_for(:transform_values!)) unless block_given?

      each { |k, v| self[k] = yield(v) }
    end
  end

end