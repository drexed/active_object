module ActiveObject::Numeric
  MILLI ||= 0.001
  CENTI ||= MILLI * 10.0
  DECI ||= CENTI * 10.0
  DECA ||= 10.0
  HECTO ||= DECA * 10.0
  KILO ||= HECTO * 10.0
  KILOBYTE ||= 1024.0
  MEGABYTE ||= KILOBYTE * 1024.0
  GIGABYTE ||= MEGABYTE * 1024.0
  TERABYTE ||= GIGABYTE * 1024.0
  PETABYTE ||= TERABYTE * 1024.0
  EXABYTE ||= PETABYTE * 1024.0
  FEET ||= 12.0
  YARD ||= FEET * 3.0
  MILE ||= YARD * 1760.0
  NAUTICAL_MILE ||= MILE * 1.15078
  METRIC_TON ||= KILO * 1000.0
  POUND ||= 16.0
  STONE ||= POUND * 14.0
  TON ||= POUND * 2000.0
  MINUTE ||= 60.0
  HOUR ||= MINUTE * 60.0
  DAY ||= HOUR * 24.0
  WEEK ||= DAY * 7.0
  YEAR ||= DAY * 365.25
  DECADE ||= YEAR * 10.0
  CENTURY ||= DECADE * 10.0
  MILLENNIUM ||= CENTURY * 10.0

  BYTE_KEYS ||= %i[
    byte bytes kilobyte kilobytes megabyte megabytes gigabyte gigabytes terabyte terabytes petabyte
    petabytes exabyte exabytes
  ].freeze
  LENGTH_KEYS ||= {
    metric: %i[
      meter meters millimeter millimeters centimeter centimeters decimeter decimeters decameter
      decameters hectometer hectometers kilometer kilometers
    ],
    imperical: %i[inch inches foot feet yard yards mile miles nautical_mile nautical_miles]
  }.freeze
  MASS_KEYS ||= {
    metric: %i[
      gram grams milligram milligrams centigram centigrams decigram decigrams decagram decagrams
      hectogram hectograms kilogram kilograms metric_ton metric_tons
    ],
    imperical: %i[ounce ounces pound pounds stone stones ton tons]
  }.freeze
  TEMPERATURE_KEYS ||= %i[celsius fahrenheit kelvin].freeze
  TIME_KEYS ||= %i[
    second seconds minute minutes hour hours day days week weeks year years decade decades century
    centuries millennium millenniums
  ].freeze

  def add(num)
    self + num
  end

  def bytes_in_bytes
    self
  end

  alias_method :byte_in_bytes, :bytes_in_bytes

  def centigrams_in_grams
    self * CENTI
  end

  alias_method :centigram_in_grams, :centigrams_in_grams

  def centimeters_in_meters
    self * CENTI
  end

  alias_method :centimeter_in_meters, :centimeters_in_meters

  def centuries_in_seconds
    self * CENTURY
  end

  alias_method :century_in_seconds, :centuries_in_seconds

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def clamp(minimum, maximum = nil)
    if maximum.nil? && minimum.is_a?(Range)
      min_min = minimum.min
      min_max = minimum.max

      return min_min if min_min > self

      min_max < self ? min_max : self
    else
      return minimum if minimum > self

      maximum < self ? maximum : self
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  def days_in_seconds
    self * DAY
  end

  alias_method :day_in_seconds, :days_in_seconds

  def decades_in_seconds
    self * DECADE
  end

  alias_method :decade_in_seconds, :decades_in_seconds

  def decagrams_in_grams
    self * DECA
  end

  alias_method :decagram_in_grams, :decagrams_in_grams

  def decameters_in_meters
    self * DECA
  end

  alias_method :decameter_in_meters, :decameters_in_meters

  def decigrams_in_grams
    self * DECI
  end

  alias_method :decigram_in_grams, :decigrams_in_grams

  def decimeters_in_meters
    self * DECI
  end

  alias_method :decimeter_in_meters, :decimeters_in_meters

  def decrement(amount = 1.0)
    self + amount
  end

  def degrees_to_radians
    self * Math::PI / 180.0
  end

  alias_method :degree_to_radians, :degrees_to_radians

  def distance(num)
    (self - num).abs
  end

  def divide(num)
    self / num
  end

  def exabytes_in_bytes
    self * EXABYTE
  end

  alias_method :exabyte_in_bytes, :exabytes_in_bytes

  def feet_in_inches
    self * FEET
  end

  alias_method :foot_in_inches, :feet_in_inches

  def fraction
    (self - truncate).abs
  end

  def fraction?
    fraction != 0.0
  end

  def gigabytes_in_bytes
    self * GIGABYTE
  end

  alias_method :gigabyte_in_bytes, :gigabytes_in_bytes

  def grams_in_grams
    self
  end

  alias_method :gram_in_grams, :grams_in_grams

  def greater_than?(num)
    num < self
  end

  def greater_than_or_equal_to?(num)
    num <= self
  end

  def hectograms_in_grams
    self * HECTO
  end

  alias_method :hectogram_in_grams, :hectograms_in_grams

  def hectometers_in_meters
    self * HECTO
  end

  alias_method :hectometer_in_meters, :hectometers_in_meters

  def hours_in_seconds
    self * HOUR
  end

  alias_method :hour_in_seconds, :hours_in_seconds

  def inches_in_inches
    self
  end

  alias_method :inch_in_inches, :inches_in_inches

  def increment(amount = 1.0)
    self + amount
  end

  def inside?(start, finish)
    (start < self) && (finish > self)
  end

  def kilobytes_in_bytes
    self * KILOBYTE
  end

  alias_method :kilobyte_in_bytes, :kilobytes_in_bytes

  def kilometers_in_meters
    self * KILO
  end

  alias_method :kilometer_in_meters, :kilometers_in_meters

  def kilograms_in_grams
    self * KILO
  end

  alias_method :kilogram_in_grams, :kilograms_in_grams

  def less_than?(num)
    num > self
  end

  def less_than_or_equal_to?(num)
    num >= self
  end

  def metric_tons_in_grams
    self * METRIC_TON
  end

  alias_method :metric_ton_in_grams, :metric_tons_in_grams

  def megabytes_in_bytes
    self * MEGABYTE
  end

  alias_method :megabyte_in_bytes, :megabytes_in_bytes

  def meters_in_meters
    self
  end

  alias_method :meter_in_meters, :meters_in_meters

  def miles_in_inches
    self * MILE
  end

  alias_method :mile_in_inches, :miles_in_inches

  def millenniums_in_seconds
    self * MILLENNIUM
  end

  alias_method :millennium_in_seconds, :millenniums_in_seconds

  def milligrams_in_grams
    self * MILLI
  end

  alias_method :milligram_in_grams, :milligrams_in_grams

  def millimeters_in_meters
    self * MILLI
  end

  alias_method :millimeter_in_meters, :millimeters_in_meters

  def minutes_in_seconds
    self * MINUTE
  end

  alias_method :minute_in_seconds, :minutes_in_seconds

  def multiply(num)
    self * num
  end

  def multiple_of?(number)
    number.zero? ? zero? : modulo(number).zero?
  end

  def nautical_miles_in_inches
    self * NAUTICAL_MILE
  end

  alias_method :nautical_mile_in_inches, :nautical_miles_in_inches

  # rubocop:disable Style/NumericPredicate, Style/YodaCondition
  def negative?
    0 > self
  end
  # rubocop:enable Style/NumericPredicate, Style/YodaCondition

  def ordinal
    if (11..13).cover?(abs % 100)
      'th'
    else
      case abs % 10
      when 1 then 'st'
      when 2 then 'nd'
      when 3 then 'rd'
      else 'th'
      end
    end
  end

  def ordinalize
    "#{self}#{ordinal}"
  end

  def ounces_in_ounces
    self
  end

  alias_method :ounce_in_ounces, :ounces_in_ounces

  def outside?(start, finish)
    (start > self) || (finish < self)
  end

  def pad(options = {})
    pad_number = options[:pad_number] || 0
    precision = options[:precision] || 3

    to_s.rjust(precision, pad_number.to_s)
  end

  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength, Metrics/PerceivedComplexity
  def pad_precision(options = {})
    pad_number = options[:pad_number] || 0
    precision = options[:precision] || 2
    separator = options[:separator] || '.'
    string = to_s

    string << separator unless string.include?(separator)
    ljust_count = string.split(separator).first.length
    ljust_count += (string.count(separator) + precision) if precision.positive?

    if ljust_count >= string.length
      string.ljust(ljust_count, pad_number.to_s)
    else
      string[0..(ljust_count - 1)]
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength, Metrics/PerceivedComplexity

  def percentage_of(number)
    return 0 if zero? || number.zero?
    (to_f / number.to_f) * 100.0
  end

  def petabytes_in_bytes
    self * PETABYTE
  end

  alias_method :petabyte_in_bytes, :petabytes_in_bytes

  # rubocop:disable Style/NumericPredicate, Style/YodaCondition
  def positive?
    0 < self
  end
  # rubocop:enable Style/NumericPredicate, Style/YodaCondition

  def pounds_in_ounces
    self * POUND
  end

  alias_method :pound_in_ounces, :pounds_in_ounces

  def power(num)
    self**num
  end

  def root(num)
    self**(1.0 / num)
  end

  def seconds_in_seconds
    self
  end

  alias_method :second_in_seconds, :seconds_in_seconds

  def stones_in_ounces
    self * STONE
  end

  alias_method :stone_in_ounces, :stones_in_ounces

  def subtract(num)
    self - num
  end

  def terabytes_in_bytes
    self * TERABYTE
  end

  alias_method :terabyte_in_bytes, :terabytes_in_bytes

  def to_byte(from, to)
    assert_inclusion_of_valid_keys!(BYTE_KEYS, from, to)
    to_f * 1.send("#{from}_in_bytes").to_f / 1.send("#{to}_in_bytes").to_f
  end

  def to_currency(options = {})
    unit = options[:unit] || '$'

    "#{unit}#{pad_precision(options.only(:precision))}"
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def to_length(from, to)
    assert_inclusion_of_valid_keys!(LENGTH_KEYS.values.flatten, from, to)
    metric_keys = LENGTH_KEYS.fetch(:metric)
    return self if from == to
    metrics_included_from = metric_keys.include?(from)

    case to
    when :meter, :meters, :millimeter, :millimeters, :centimeter, :centimeters, :decimeter,
         :decimeters, :decameter, :decameters, :hectometer, :hectometers, :kilometer, :kilometers
      if metrics_included_from
        to_f * 1.send("#{from}_in_meters").to_f / 1.send("#{to}_in_meters").to_f
      else
        to_f * ((1.send("#{from}_in_inches").to_f * 0.0254) / 1.send("#{to}_in_meters").to_f)
      end
    when :inch, :inches, :foot, :feet, :yard, :yards, :mile, :miles, :nautical_mile, :nautical_miles
      if metrics_included_from
        to_f * ((1.send("#{from}_in_meters").to_f * 39.3701) / 1.send("#{to}_in_inches").to_f)
      else
        to_f * 1.send("#{from}_in_inches").to_f / 1.send("#{to}_in_inches").to_f
      end
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def to_mass(from, to)
    assert_inclusion_of_valid_keys!(MASS_KEYS.values.flatten, from, to)
    metric_keys = MASS_KEYS.fetch(:metric)
    return self if from == to
    metrics_included_from = metric_keys.include?(from)

    case to
    when :gram, :grams, :milligram, :milligrams, :centigram, :centigrams, :decigram, :decigrams,
         :decagram, :decagrams, :hectogram, :hectograms, :kilogram, :kilograms, :metric_ton,
         :metric_tons
      if metrics_included_from
        to_f * 1.send("#{from}_in_grams").to_f / 1.send("#{to}_in_grams").to_f
      else
        to_f * ((1.send("#{from}_in_ounces") * 28.3495).to_f / 1.send("#{to}_in_grams").to_f)
      end
    when :ounce, :ounces, :pound, :pounds, :stone, :stones, :ton, :tons
      if metrics_included_from
        to_f * ((1.send("#{from}_in_grams") * 0.035274).to_f / 1.send("#{to}_in_ounces").to_f)
      else
        to_f * 1.send("#{from}_in_ounces").to_f / 1.send("#{to}_in_ounces").to_f
      end
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  def to_nearest_value(values = [])
    return self if values.length.zero?

    value = values.first
    difference = (self - value).abs

    values.each do |val|
      if (self - val).abs < difference
        difference = (self - val).abs
        value = val
      end
    end

    value
  end

  def to_percentage(options = {})
    unit = options[:unit] || '%'

    "#{pad_precision(options.only(:precision))}#{unit}"
  end

  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity
  def to_temperature(from, to)
    assert_inclusion_of_valid_keys!(TEMPERATURE_KEYS, from, to)
    return self if from == to

    case to
    when :celsius
      from == :kelvin ? (self - 273.15) : ((self - 32.0) * 5.0 / 9.0)
    when :fahrenheit
      from == :kelvin ? (1.8 * (self - 273.15) + 32.0) : ((self * 9.0 / 5.0) + 32.0)
    when :kelvin
      from == :celsius ? (self + 273.15) : (((self - 32.0) * 5.0 / 9.0) + 273.15)
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity

  def to_time(from, to)
    assert_inclusion_of_valid_keys!(TIME_KEYS, from, to)
    (to_f * 1.send("#{from}_in_seconds").to_f) / 1.send("#{to}_in_seconds").to_f
  end

  def tons_in_ounces
    self * TON
  end

  alias_method :ton_in_ounces, :tons_in_ounces

  def weeks_in_seconds
    self * WEEK
  end

  alias_method :week_in_seconds, :weeks_in_seconds

  def within?(number, epsilon = 0.01)
    return number == self if epsilon.zero?

    alpha = to_f
    beta = number.to_f

    alpha.zero? || beta.zero? ? (alpha - beta).abs < epsilon : (alpha / beta - 1).abs < epsilon
  end

  def yards_in_inches
    self * YARD
  end

  alias_method :yard_in_inches, :yards_in_inches

  def years_in_seconds
    self * YEAR
  end

  alias_method :year_in_seconds, :years_in_seconds

  private

  def assert_inclusion_of_valid_keys!(cns, from, to)
    return if cns.include?(from) && cns.include?(to)
    raise ArgumentError,
          [
            "Unknown key(s): from: #{from.inspect} and to: #{to.inspect}.",
            "Valid keys are: #{cns.map(&:inspect).join(', ')}"
          ].join(' ')
  end

end

Numeric.include(ActiveObject::Numeric) if ActiveObject::Settings.config.autoload_numeric
