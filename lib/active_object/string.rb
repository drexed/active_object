module ActiveObject::String

  def any?(*keys)
    included = false
    keys.flatten.each do |key|
      included = include?(key)
      break if included
    end
    included
  end

  def at(position)
    self[position]
  end

  def camelize(first_letter = :upper)
    if first_letter.to_sym != :lower
      regex_last = Regexp.last_match(1).upcase

      to_s.gsub(%r{\/(.?)}) { "::#{regex_last}" }.gsub(%r{^/(?:^|_)(.)}) { regex_last }
    else
      "#{to_s.first.chr.downcase}#{camelize(self)[1..-1]}"
    end
  end

  alias_method :camelcase, :camelize

  def camelize!(first_letter = :upper)
    replace(camelize(first_letter))
  end

  alias_method :camelcase!, :camelize!

  def classify
    to_s.sub(/.*\./, '').camelize
  end

  def classify!
    replace(classify)
  end

  def constantize
    Object.const_get(self)
  end

  def dasherize
    tr(/_/, '-')
  end

  def dasherize!
    replace(dasherize)
  end

  def deconstantize
    to_s[0, rindex('::') || 0]
  end

  def deconstantize!
    replace(deconstantize)
  end

  def demodulize
    to_s.gsub(/^.*::/, '')
  end

  def demodulize!
    replace(demodulize)
  end

  def domain
    self =~ %r{^(?:\w+:\/\/)?([^\/?]+)(?:\/|\?|$)} ? Regexp.last_match(1) : self
  end

  def downcase?
    downcase == self
  end

  def ellipsize(ellipsize_at, options = {})
    return self if length <= ellipsize_at

    separator = options[:separator] || '...'
    offset = options[:offset] || 4

    "#{self[0, offset]}#{separator}#{self[-offset, offset]}"
  end

  def exclude?(string)
    !include?(string)
  end

  def first(limit = 1)
    return '' if limit.zero?

    limit >= length ? self : to(limit - 1)
  end

  def format(*args)
    super(self, *args.flatten)
  end

  def from(position)
    self[position..-1]
  end

  def humanize(options = {})
    capitalize = options[:capitalize] || true

    underscore.gsub(/_id\z/, '')
              .tr('_', ' ')
              .squish
              .gsub(/([a-z\d]*)/i, &:downcase)
              .gsub(/\A\w/) { |str| capitalize ? str.upcase : str }
  end

  def humanize!(options = {})
    replace(humanize(options))
  end

  def indent(amount, indent_string = nil, indent_empty_lines = false)
    indent_string = indent_string || self[/^[ \t]/] || ' '
    substitutes = indent_empty_lines ? /^/ : /^(?!$)/

    gsub(substitutes, indent_string * amount)
  end

  def indent!(amount, indent_string = nil, indent_empty_lines = false)
    replace(indent(amount, indent_string, indent_empty_lines))
  end

  def index_all(pattern)
    pattern = pattern.to_s if pattern.is_a?(Numeric)
    arr_indexes = []
    srch_index = rindex(pattern)

    while srch_index
      temp_string = self[0..(srch_index - 1)]
      arr_indexes << srch_index
      srch_index = srch_index.zero? ? nil : temp_string.rindex(pattern)
    end

    arr_indexes.reverse
  end

  def labelize(options = {})
    capitalize = options[:capitalize] || true

    underscore.tr('_', ' ')
              .squish
              .gsub(/([a-z\d]*)/i, &:downcase)
              .gsub(/\A\w/) { |str| capitalize ? str.upcase : str }
              .gsub(/ id\z/, ' ID')
  end

  alias_method :labelcase, :labelize

  def labelize!(options = {})
    replace(labelize(options))
  end

  alias_method :labelcase!, :labelize!

  def last(limit = 1)
    return '' if limit.zero?

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

  def parameterize(separator: '-')
    underscore.gsub(/\s+/, separator).downcase
  end

  def parameterize!(separator: '-')
    replace(parameterize(separator: separator))
  end

  def pollute(delimiter = '^--^--^')
    split('').map { |chr| "#{chr}#{delimiter}" }.join
  end

  def pollute!(delimiter = '^--^--^')
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
    patterns.flatten.each { |pat| pat.is_a?(Range) ? string.slice!(pat) : string.gsub!(pat, '') }
    string
  end

  def remove!(*patterns)
    replace(remove(*patterns))
  end

  def remove_tags
    gsub(%r{<\/?[^>]*>}, '')
  end

  def remove_tags!
    replace(remove_tags)
  end

  def sample(separator = ' ')
    split(separator).sample
  end

  def sample!(separator = ' ')
    replace(sample(separator))
  end

  def shift(*patterns)
    return self[0] if patterns.empty?

    string = dup
    patterns.flatten.each { |pat| string.sub!(pat, '') }
    string
  end

  def shift!(*patterns)
    replace(shift(*patterns))
  end

  def shuffle(separator = '')
    split(separator).shuffle.join
  end

  def shuffle!(separator = '')
    replace(shuffle(separator))
  end

  def sift(chars_to_keep)
    chars_to_keep = case chars_to_keep
                    when String then chars_to_keep.chars
                    when Array then chars_to_keep.map(&:to_s)
                    when Range then chars_to_keep.to_a.map(&:to_s)
                    else
                      raise TypeError, 'Invalid parameter'
                    end

    chars.keep_if { |chr| chars_to_keep.include?(chr) }.join
  end

  def sift!(chars_to_keep)
    replace(sift(chars_to_keep))
  end

  def slugify
    to_s.gsub(/[^\x00-\x7F]+/, '')
        .gsub(/[^\w_ \-]+/i, '')
        .gsub(/[ \-]+/i, '-')
        .gsub(/^\-|\-$/i, '')
        .downcase
  end

  def slugify!
    replace(slugify)
  end

  def squish
    strip.gsub(/\s+/, ' ')
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

  def truncate(truncate_at, options = {})
    return dup unless length > truncate_at

    omission = options[:omission] || '...'
    size_with_room_for_omission = truncate_at - omission.length

    seperator = options[:separator]
    stop = if seperator
             rindex(seperator || '', size_with_room_for_omission) || size_with_room_for_omission
           else
             size_with_room_for_omission
           end

    "#{self[0, stop]}#{omission}"
  end

  def truncate_words(words_count, options = {})
    sep = options[:separator] || /\s+/
    sep = Regexp.escape(sep.to_s) unless sep.is_a(Regexp)

    return self unless  self =~ /\A((?:.+?#{sep}){#{words_count - 1}}.+?)#{sep}.*/m

    "#{Regexp.last_match(1)}#{options[:omissio] || '...'}"
  end

  def underscore
    to_s.gsub(/::/, '/')
        .gsub(/([A-Z\d]+)([A-Z][a-z])/, "\1_\2")
        .gsub(/([a-z\d])([A-Z])/, "\1_\2")
        .tr('-', '_')
        .downcase
  end

  def underscore!
    replace(underscore)
  end

  def unpollute(delimiter = '^--^--^')
    gsub(delimiter, '')
  end

  def unpollute!(delimiter = '^--^--^')
    replace(unpollute(delimiter))
  end

  def upcase?
    upcase == self
  end

  def unshift(*patterns)
    string = ''
    patterns.flatten.each { |pat| string.concat(pat) }
    string.concat(self)
    string
  end

  def unshift!(*patterns)
    replace(unshift(*patterns))
  end

end

String.include(ActiveObject::String) if ActiveObject::Settings.config.autoload_string
