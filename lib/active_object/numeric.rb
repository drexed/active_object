module ActiveObject::Numeric

  MILLI = 0.001
  CENTI = MILLI * 10
  DECI = CENTI * 10
  DECA = 10
  HECTO = DECA * 10
  KILO = HECTO * 10

  KILOBYTE = 1024
  MEGABYTE = KILOBYTE * 1024
  GIGABYTE = MEGABYTE * 1024
  TERABYTE = GIGABYTE * 1024
  PETABYTE = TERABYTE * 1024
  EXABYTE = PETABYTE * 1024

  FEET = 12
  YARD = FEET * 3
  MILE = YARD * 1760
  NAUTICAL_MILE = MILE * 1.15078

  METRIC_TON = KILO * 1000
  POUND = 16
  STONE = POUND * 14
  TON = POUND * 2000

  MINUTE = 60
  HOUR = MINUTE * 60
  DAY = HOUR * 24
  WEEK = DAY * 7
  YEAR = DAY * 365.25
  DECADE = YEAR * 10
  CENTURY = DECADE * 10
  MILLENNIUM = CENTURY * 10

  BYTE_KEYS = [
    :byte, :bytes, :kilobyte, :kilobytes, :megabyte, :megabytes, :gigabyte,
    :gigabytes, :terabyte, :terabytes, :petabyte, :petabytes, :exabyte, :exabytes
  ]
  LENGTH_KEYS = {
    metric: [
      :meter, :meters, :millimeter, :millimeters, :centimeter, :centimeters,
      :decimeter, :decimeters, :decameter, :decameters, :hectometer, :hectometers,
      :kilometer, :kilometers
    ],
    imperical: [
      :inch, :inches, :foot, :feet, :yard, :yards, :mile, :miles,
      :nautical_mile, :nautical_miles
    ]
  }
  MASS_KEYS = {
    metric: [
      :gram, :grams, :milligram, :milligrams, :centigram, :centigrams,
      :decigram, :decigrams, :decagram, :decagrams, :hectogram, :hectograms,
      :kilogram, :kilograms, :metric_ton, :metric_tons
    ],
    imperical: [:ounce, :ounces, :pound, :pounds, :stone, :stones, :ton, :tons]
  }
  TEMPERATURE_KEYS = [:celsius, :fahrenheit, :kelvin]
  TIME_KEYS = [
    :second, :seconds, :minute, :minutes, :hour, :hours, :day, :days,
    :week, :weeks, :year, :years, :decade, :decades, :century, :centuries,
    :millennium, :millenniums
  ]

  def add(n)
    self + n
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

  def decrement(amount=1.0)
    self + amount
  end

  def distance(n)
    (self - n).abs
  end

  def divide(n)
    self / n
  end

  def exabytes_in_bytes
    self * EXABYTE
  end

  alias_method :exabyte_in_bytes, :exabytes_in_bytes

  def feet_in_inches
    self * FEET
  end

  alias_method :foot_in_inches, :feet_in_inches

  def gigabytes_in_bytes
    self * GIGABYTE
  end

  alias_method :gigabyte_in_bytes, :gigabytes_in_bytes

  def grams_in_grams
    self
  end

  alias_method :gram_in_grams, :grams_in_grams

  def greater_than?(n)
    self > n
  end

  def greater_than_or_equal_to?(n)
    self >= n
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

  def increment(amount=1.0)
    self + amount
  end

  def inside?(start, finish)
    (start < self) && (self < finish)
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

  def less_than?(n)
    self < n
  end

  def less_than_or_equal_to?(n)
    self <= n
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

  def multiply(n)
    self * n
  end

  def multiple_of?(number)
    number != 0 ? modulo(number).zero? : zero?
  end

  def nautical_miles_in_inches
    self * NAUTICAL_MILE
  end

  alias_method :nautical_mile_in_inches, :nautical_miles_in_inches

  def negative?
    self < 0
  end

  def ordinal
    abs_number = abs

    if (11..13).cover?(abs_number % 100)
      "th"
    else
      case abs_number % 10
      when 1; "st"
      when 2; "nd"
      when 3; "rd"
      else "th"
      end
    end
  end

  def ordinalize
    "#{self}#{self.ordinal}"
  end

  def ounces_in_ounces
    self
  end

  alias_method :ounce_in_ounces, :ounces_in_ounces

  def outside?(start, finish)
    (self < start) || (finish < self)
  end

  def pad(options={})
    pad_number = options.fetch(:pad_number, 0)
    precision = options.fetch(:precision, 3)

    to_s.rjust(precision, pad_number.to_s)
  end

  def pad_precision(options={})
    pad_number = options.fetch(:pad_number, 0)
    precision = options.fetch(:precision, 2)
    separator = options.fetch(:separator, ".")
    string = to_s

    string << separator unless string.include?(separator)
    ljust_count =  string.split(separator).first.length
    ljust_count += (string.count(separator) + precision) if precision > 0
    num_count =  string.length
    ljust_count >= num_count ? string.ljust(ljust_count, pad_number.to_s) : string[0..(ljust_count - 1)]
  end

  def petabytes_in_bytes
    self * PETABYTE
  end

  alias_method :petabyte_in_bytes, :petabytes_in_bytes

  def positive?
    self > 0
  end

  def pounds_in_ounces
    self * POUND
  end

  alias_method :pound_in_ounces, :pounds_in_ounces

  def power(n)
    self ** n
  end

  def root(n)
    self ** (1.0 / n)
  end

  def seconds_in_seconds
    self
  end

  alias_method :second_in_seconds, :seconds_in_seconds

  def stones_in_ounces
    self * STONE
  end

  alias_method :stone_in_ounces, :stones_in_ounces

  def subtract(n)
    self - n
  end

  def terabytes_in_bytes
    self * TERABYTE
  end

  alias_method :terabyte_in_bytes, :terabytes_in_bytes

  def to_byte(from, to)
    unless BYTE_KEYS.include?(from) && BYTE_KEYS.include?(to)
      raise ArgumentError,
        "Unknown key(s): from: #{from.inspect} and to: #{to.inspect}. Valid keys are: #{BYTE_KEYS.map(&:inspect).join(', ')}"
    end

    to_f * 1.send("#{from}_in_bytes").to_f / 1.send("#{to}_in_bytes").to_f
  end

  def to_currency(options={})
    unit = options.fetch(:unit, "$")

    "#{unit}#{pad_precision(options.only(:precision))}"
  end

  def to_length(from, to)
    metric_keys = LENGTH_KEYS.fetch(:metric)
    valid_keys = LENGTH_KEYS.collect { |k, v| v }.flatten

    unless valid_keys.include?(from) && valid_keys.include?(to)
      raise ArgumentError,
        "Unknown key(s): from: #{from.inspect} and to: #{to.inspect}. Valid keys are: #{valid_keys.map(&:inspect).join(', ')}"
    end

    case to
    when from
      self
    when :meter, :meters, :millimeter, :millimeters, :centimeter, :centimeters, :decimeter, :decimeters, :decameter, :decameters, :hectometer, :hectometers, :kilometer, :kilometers
      if metric_keys.include?(from)
        to_f * 1.send("#{from}_in_meters").to_f / 1.send("#{to}_in_meters").to_f
      else
        to_f * ((1.send("#{from}_in_inches").to_f * 0.0254) / 1.send("#{to}_in_meters").to_f)
      end
    when :inch, :inches, :foot, :feet, :yard, :yards, :mile, :miles, :nautical_mile, :nautical_miles
      if metric_keys.include?(from)
        to_f * ((1.send("#{from}_in_meters").to_f * 39.3701) / 1.send("#{to}_in_inches").to_f)
      else
        to_f * 1.send("#{from}_in_inches").to_f / 1.send("#{to}_in_inches").to_f
      end
    end
  end

  def to_mass(from, to)
    metric_keys = MASS_KEYS.fetch(:metric)
    valid_keys = MASS_KEYS.collect { |k, v| v }.flatten

    unless valid_keys.include?(from) && valid_keys.include?(to)
      raise ArgumentError,
        "Unknown key(s): from: #{from.inspect} and to: #{to.inspect}. Valid keys are: #{valid_keys.map(&:inspect).join(', ')}"
    end

    case to
    when from
      self
    when :gram, :grams, :milligram, :milligrams, :centigram, :centigrams, :decigram, :decigrams, :decagram, :decagrams, :hectogram, :hectograms, :kilogram, :kilograms, :metric_ton, :metric_tons
      if metric_keys.include?(from)
        to_f * 1.send("#{from}_in_grams").to_f / 1.send("#{to}_in_grams").to_f
      else
        to_f * ((1.send("#{from}_in_ounces") * 28.3495).to_f / 1.send("#{to}_in_grams").to_f)
      end
    when :ounce, :ounces, :pound, :pounds, :stone, :stones, :ton, :tons
      if metric_keys.include?(from)
        to_f * ((1.send("#{from}_in_grams") * 0.035274).to_f / 1.send("#{to}_in_ounces").to_f)
      else
        to_f * 1.send("#{from}_in_ounces").to_f / 1.send("#{to}_in_ounces").to_f
      end
    end
  end

  def to_nearest_value(values=[])
    return(self) if values.length.zero?

    value = values.first
    difference = (self - value).abs

    values.each do |v|
      if (self - v).abs < difference
        difference = (self - v).abs
        value = v
      end
    end

    value
  end

  def to_percentage(options={})
    unit = options.fetch(:unit, "%")

    "#{pad_precision(options.only(:precision))}#{unit}"
  end

  def to_temperature(from, to)
    unless TEMPERATURE_KEYS.include?(from) && TEMPERATURE_KEYS.include?(to)
      raise ArgumentError,
        "Unknown key(s): from: #{from.inspect} and to: #{to.inspect}. Valid keys are: #{TEMPERATURE_KEYS.map(&:inspect).join(', ')}"
    end

    case to
    when from
      self
    when :celsius
      from == :kelvin ? (self - 273.15) : ((self - 32.0) * 5.0 / 9.0)
    when :fahrenheit
      from == :kelvin ? (1.8 * (self - 273.15) + 32.0) : ((self * 9.0 / 5.0) + 32.0)
    when :kelvin
      from == :celsius ? (self + 273.15) : (((self - 32.0) * 5.0 / 9.0) + 273.15)
    end
  end

  def to_time(from, to)
    unless TIME_KEYS.include?(from) && TIME_KEYS.include?(to)
      raise ArgumentError,
        "Unknown key(s): from: #{from.inspect} and to: #{to.inspect}. Valid keys are: #{TIME_KEYS.map(&:inspect).join(', ')}"
    end

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

  def within?(number, epsilon=0.01)
    return(self == number) if epsilon.zero?

    a, b = to_f, number.to_f

    (a.zero? || b.zero?) ? ((a - b).abs < epsilon) : ((a / b - 1).abs < epsilon)
  end

  def yards_in_inches
    self * YARD
  end

  alias_method :yard_in_inches, :yards_in_inches

  def years_in_seconds
    self * YEAR
  end

  alias_method :year_in_seconds, :years_in_seconds

end

Numeric.send(:include, ActiveObject::Numeric) if ActiveObject.configuration.autoload_numeric
