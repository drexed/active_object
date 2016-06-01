module ActiveObject::String

  def any?(*keys)
    included = false
    keys.flatten.each { |k| break if included = include?(k) }
    included
  end

  def at(position)
    self[position]
  end

  def camelize(first_letter=:upper)
    if first_letter.to_sym != :lower
      to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
    else
      "#{to_s.first.chr.downcase}#{camelize(self)[1..-1]}"
    end
  end

  alias_method :camelcase, :camelize

  def camelize!(first_letter=:upper)
    replace(camelize(first_letter))
  end

  alias_method :camelcase!, :camelize!

  def classify
    to_s.sub(/.*\./, "").camelize
  end

  def classify!
    replace(classify)
  end

  def constantize
    Object.const_get(self)
  end

  def dasherize
    gsub(/_/, "-")
  end

  def dasherize!
    replace(dasherize)
  end

  def deconstantize
    to_s[0, rindex("::") || 0]
  end

  def deconstantize!
    replace(deconstantize)
  end

  def demodulize
    to_s.gsub(/^.*::/, "")
  end

  def demodulize!
    replace(demodulize)
  end

  def domain
    self =~ (/^(?:\w+:\/\/)?([^\/?]+)(?:\/|\?|$)/) ? $1 : self
  end

  def downcase?
    downcase == self
  end

  def ellipsize(ellipsize_at, options={})
     return(self) if length <= ellipsize_at

     separator = options.fetch(:separator, "...")
     offset = options.fetch(:offset, 4)

     "#{self[0, offset]}#{separator}#{self[-offset, offset]}"
  end

  def exclude?(string)
    !include?(string)
  end

  def first(limit=1)
    return("") if limit.zero?

    limit >= length ? self : to(limit - 1)
  end

  def format(*args)
    super(self, *(args.flatten))
  end

  def from(position)
    self[position..-1]
  end

  def humanize(options={})
    capitalize = options.fetch(:capitalize, true)

    underscore.
    gsub(/_id\z/, "").
    tr("_", " ").
    squish.
    gsub(/([a-z\d]*)/i) { |s| s.downcase }.
    gsub(/\A\w/) { |s| capitalize ? s.upcase : s }
  end

  def humanize!(options={})
    replace(humanize(options))
  end

  def indent(amount, indent_string=nil, indent_empty_lines=false)
    indent_string = indent_string || self[/^[ \t]/] || " "
    substitutes = indent_empty_lines ? /^/ : /^(?!$)/

    gsub(substitutes, indent_string * amount)
  end

  def indent!(amount, indent_string=nil, indent_empty_lines=false)
    replace(indent(amount, indent_string, indent_empty_lines))
  end

  def index_all(pattern)
    pattern = pattern.to_s if pattern.is_a?(Numeric)
    arr_indexes = []
    srch_index = rindex(pattern)

    while srch_index do
      temp_string = self[0..(srch_index - 1)]
      arr_indexes << srch_index
      srch_index = srch_index.zero? ? nil : temp_string.rindex(pattern)
    end

    arr_indexes.reverse
  end

  def labelize(options={})
    capitalize = options.fetch(:capitalize, true)

    underscore.
    tr("_", " ").
    squish.
    gsub(/([a-z\d]*)/i) { |s| s.downcase }.
    gsub(/\A\w/) { |s| capitalize ? s.upcase : s }.
    gsub(/ id\z/, " ID")
  end

  alias_method :labelcase, :labelize

  def labelize!(options={})
    replace(labelize(options))
  end

  alias_method :labelcase!, :labelize!


  def last(limit=1)
    return("") if limit.zero?

    limit >= length ? self : from(-limit)
  end

  def mixedcase?
    !upcase? && !downcase?
  end

  def ordinal
    to_i.ordinal
  end

  def ordinalize
    to_i.ordinalize
  end

  def parameterize(seperator="-")
    underscore.gsub(/\s+/, seperator).downcase
  end

  def parameterize!(seperator="-")
    replace(parameterize(seperator))
  end

  def pollute(delimiter="^--^--^")
    split("").map { |c| "#{c}#{delimiter}" }.join
  end

  def pollute!(delimiter="^--^--^")
    replace(pollute(delimiter))
  end

  def pop
    self[-1]
  end

  def push(string)
    replace(concat(string))
  end

  def remove(*patterns)
    string = dup

    patterns.flatten.each do |p|
      if p.is_a?(Range)
        string.slice!(p)
      else
        string.gsub!(p, "")
      end
    end

    string
  end

  def remove!(*patterns)
    replace(remove(*patterns))
  end

  def remove_tags
    gsub(/<\/?[^>]*>/, "")
  end

  def remove_tags!
    replace(remove_tags)
  end

  def sample(separator=" ")
    split(separator).sample
  end

  def sample!(separator=" ")
    replace(sample(separator))
  end

  def shift(*patterns)
    if patterns.empty?
      self[0]
    else
      string = dup
      patterns.flatten.each { |p| string.sub!(p, "") }
      string
    end
  end

  def shift!(*patterns)
    replace(shift(*patterns))
  end

  def shuffle(separator="")
    split(separator).shuffle.join
  end

  def shuffle!(separator="")
    replace(shuffle(separator))
  end

  def sift(chars_to_keep)
    chars_to_keep = case chars_to_keep
                    when String then chars_to_keep.chars
                    when Array then chars_to_keep.map { |c| c.to_s }
                    when Range then chars_to_keep.to_a.map { |c| c.to_s }
                    else
                      raise TypeError, "Invalid parameter"
                    end

    chars.keep_if { |chr| chars_to_keep.include?(chr) }.join
  end

  def sift!(chars_to_keep)
    replace(sift(chars_to_keep))
  end

  def slugify
    gsub(/[^\x00-\x7F]+/, "").
    gsub(/[^\w_ \-]+/i, "").
    gsub(/[ \-]+/i, "-").
    gsub(/^\-|\-$/i, "").
    downcase
  end

  def slugify!
    replace(slugify)
  end

  def squish
    strip.gsub(/\s+/, " ")
  end

  def squish!
    replace(squish)
  end

  def sort
    chars.sort.join
  end

  def sort!
    replace(sort)
  end

  def titleize
    underscore.humanize.gsub(/\b(?<!['’`])[a-z]/) { $&.capitalize }
  end

  alias_method :titlecase, :titleize

  def titleize!
    replace(titleize)
  end

  alias_method :titlecase!, :titleize!

  def to(position)
    self[0..position]
  end

  def truncate(truncate_at, options={})
    return(dup) unless length > truncate_at

    omission = options.fetch(:omission, "...")
    size_with_room_for_omission = truncate_at - omission.length

    stop = if options.fetch(:separator, false)
      rindex(options.fetch(:separator, ""), size_with_room_for_omission) || size_with_room_for_omission
    else
      size_with_room_for_omission
    end

    "#{self[0, stop]}#{omission}"
  end

  def truncate_words(words_count, options={})
    sep = options.fetch(:separator, /\s+/)
    sep = Regexp.escape(sep.to_s) unless Regexp === sep

    if self =~ /\A((?:.+?#{sep}){#{words_count - 1}}.+?)#{sep}.*/m
      "#{$1}#{options.fetch(:omission, '...')}"
    else
      self
    end
  end

  def underscore
    gsub(/::/, "/").
    gsub(/([A-Z\d]+)([A-Z][a-z])/, "\1_\2").
    gsub(/([a-z\d])([A-Z])/, "\1_\2").
    tr("-", "_").
    downcase
  end

  def underscore!
    replace(underscore)
  end

  def unpollute(delimiter="^--^--^")
    gsub(delimiter, "")
  end

  def unpollute!(delimiter="^--^--^")
    replace(unpollute(delimiter))
  end

  def upcase?
    upcase == self
  end

  def unshift(*patterns)
    string = ""
    patterns.flatten.each { |p| string.concat(p) }
    string.concat(self)
    string
  end

  def unshift!(*patterns)
    replace(unshift(*patterns))
  end

end

String.send(:include, ActiveObject::String) if ActiveObject.configuration.autoload_string
