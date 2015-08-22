class String

  def any?(*keys)
    included = false

    keys.flatten.each do |key|
      (included = true) if include?(key)
      break if included
    end

    return(included)
  end

  unless defined?(Rails)
    def at(position)
      self[position]
    end
  end

  unless defined?(Rails)
    def camelize(first_letter=:upper)
      if first_letter != :lower
        to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
      else
        to_s.first.chr.downcase + camelize(self)[1..-1]
      end
    end

    alias_method :camelcase, :camelize
  end

  unless defined?(Rails)
    def camelize!(first_letter=:upper)
      replace(camelize(first_letter))
    end

    alias_method :camelcase!, :camelize!
  end

  unless defined?(Rails)
    def classify
      to_s.sub(/.*\./, "").camelize
    end
  end

  unless defined?(Rails)
    def classify!
      replace(classify)
    end
  end

  unless defined?(Rails)
    def constantize
      Object.const_get(self)
    end
  end

  unless defined?(Rails)
    def dasherize
      gsub(/_/, "-")
    end
  end

  unless defined?(Rails)
    def dasherize!
      replace(dasherize)
    end
  end

  unless defined?(Rails)
    def deconstantize
      to_s[0, rindex('::') || 0]
    end
  end

  unless defined?(Rails)
    def deconstantize!
      replace(deconstantize)
    end
  end

  unless defined?(Rails)
    def demodulize
      to_s.gsub(/^.*::/, "")
    end
  end

  unless defined?(Rails)
    def demodulize!
      replace(demodulize)
    end
  end

  def domain
    string = dup
    string =~ (/^(?:\w+:\/\/)?([^\/?]+)(?:\/|\?|$)/) ? $1 : string
  end

  def downcase?
    downcase == self
  end

  def ellipsize(ellipsize_at, options={})
     return(self)if size <= ellipsize_at
     separator = options.fetch(:separator, "...")
     offset    = options.fetch(:offset, 4)

     "#{self[0,offset]}#{separator}#{self[-offset,offset]}"
  end

  unless defined?(Rails)
    def exclude?(string)
      !include?(string)
    end
  end

  unless defined?(Rails)
    def first(limit=1)
      return("") if limit.zero?
      limit >= size ? self.dup : to(limit - 1)
    end
  end

  unless defined?(Rails)
    def from(position)
      self[position..-1]
    end
  end

  unless defined?(Rails)
    def humanize(options = {})
      underscore.
      gsub(/_id\z/, "").
      tr("_", " ").
      gsub(/([a-z\d]*)/i) { |s| s.downcase }.
      gsub(/\A\w/) { |s| options.fetch(:capitalize, true) ? s.upcase : s }
    end
  end

  unless defined?(Rails)
    def humanize!(options={})
      replace(humanize(options))
    end
  end

  unless defined?(Rails)
    def indent(amount, indent_string=nil, indent_empty_lines=false)
      indent_string = indent_string || self[/^[ \t]/] || " "
      substitutes   = indent_empty_lines ? /^/ : /^(?!$)/
      gsub(substitutes, indent_string * amount)
    end
  end

  unless defined?(Rails)
    def indent!(amount, indent_string=nil, indent_empty_lines=false)
      replace(indent(amount, indent_string, indent_empty_lines))
    end
  end

  unless defined?(Rails)
    def last(limit=1)
      return("") if limit.zero?
      limit >= size ? self.dup : from(-limit)
    end
  end

  def mixedcase?
    !upcase? && !downcase?
  end

  unless defined?(Rails)
    def ordinal
      to_i.ordinal
    end
  end

  unless defined?(Rails)
    def ordinalize
      to_i.ordinalize
    end
  end

  unless defined?(Rails)
    def parameterize(sep="-")
      underscore.
      gsub(/\s+/, "_").
      gsub("_", sep).
      downcase
    end
  end

  unless defined?(Rails)
    def parameterize!(sep="-")
      replace(parameterize(sep))
    end
  end

  def pollute(delimiter="^--^--^")
    split('').map { |c| "#{c}#{delimiter}" }.join
  end

  unless defined?(Rails)
    def remove(*patterns)
      string = dup
      patterns.flatten.each do |pattern|
        string.gsub!(pattern, "")
      end
      string
    end
  end

  unless defined?(Rails)
    def remove!(*patterns)
      replace(remove(*patterns))
    end
  end

  def remove_tags
    gsub(/<\/?[^>]*>/, "")
  end

  def remove_tags!
    replace(remove_tags)
  end

  def sample(separator=' ')
    split(separator).sample
  end

  def sample!(separator=' ')
    replace(sample(separator))
  end

  def shift(*patterns)
    string = dup
    patterns.flatten.each do |pattern|
      string.sub!(pattern, "")
    end
    string
  end

  def shift!(*patterns)
    replace(shift(*patterns))
  end

  def shuffle(separator='')
    split(separator).shuffle.join
  end

  def shuffle!(separator='')
    replace(shuffle(separator))
  end

  def slugify
    gsub(/[^\x00-\x7F]+/, '').
    gsub(/[^\w_ \-]+/i,   '').
    gsub(/[ \-]+/i,      '-').
    gsub(/^\-|\-$/i,      '').
    downcase
  end

  def slugify!
    replace(slugify)
  end

  unless defined?(Rails)
    def squish
      strip.gsub(/\s+/, ' ')
    end
  end

  unless defined?(Rails)
    def squish!
      replace(squish)
    end
  end

  unless defined?(Rails)
    def titleize
      underscore.
      humanize.
      gsub(/\b(?<!['’`])[a-z]/) { $&.capitalize }
    end

    alias_method :titlecase, :titleize
  end

  unless defined?(Rails)
    def titleize!
      replace(titleize)
    end

    alias_method :titlecase!, :titleize!
  end

  unless defined?(Rails)
    def to(position)
      self[0..position]
    end
  end

  unless defined?(Rails)
    def truncate(truncate_at, options={})
      return(dup) unless size > truncate_at

      omission = options.fetch(:omission, "...")
      size_with_room_for_omission = truncate_at - omission.size

      stop = if options.fetch(:separator, false)
          rindex(options.fetch(:separator, ''), size_with_room_for_omission) || size_with_room_for_omission
        else
          size_with_room_for_omission
        end

      "#{self[0, stop]}#{omission}"
    end
  end

  unless defined?(Rails)
    def truncate_words(words_count, options={})
      sep = options[:separator] || /\s+/
      sep = Regexp.escape(sep.to_s) unless Regexp === sep

      if self =~ /\A((?:.+?#{sep}){#{words_count - 1}}.+?)#{sep}.*/m
        $1 + (options[:omission] || '...')
      else
        dup
      end
    end
  end

  unless defined?(Rails)
    def underscore
      gsub(/::/, '/').
      gsub(/([A-Z\d]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
    end
  end

  unless defined?(Rails)
    def underscore!
      replace(underscore)
    end
  end

  def unpollute(delimiter="^--^--^")
    gsub(delimiter, "")
  end

  def upcase?
    upcase == self
  end

end