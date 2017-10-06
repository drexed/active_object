# frozen_string_literal: true

module ActiveObject::Time
  MINUTE ||= 60.0
  HOUR ||= MINUTE * 60.0
  DAY ||= HOUR * 24.0
  WEEK ||= DAY * 7.0
  YEAR ||= DAY * 365.25
  DECADE ||= YEAR * 10.0
  CENTURY ||= DECADE * 10.0
  MILLENNIUM ||= CENTURY * 10.0

  KEY_UNITS ||= {
    month: '%m', month_padded: '%m', month_unpadded: '%-m', month_blank: '%_m', month_name: '%B',
    month_name_abbr: '%b', month_year: '%m %Y', month_padded_year: '%m %Y',
    month_unpadded_year: '%-m %Y', month_blank_year: '%_m %Y', month_name_year: '%B %Y',
    month_name_abbr_year: '%b %Y', weekday: '%d', weekday_padded: '%d', weekday_unpadded: '%-d',
    weekday_blank: '%_d', weekday_name: '%A', weekday_name_abbr: '%a', yr: '%y', year_abbr: '%y',
    year: '%Y', hour: '%H', hour_padded: '%H', hour_blank: '%k', hour_imperical: '%I',
    hour_imperical_padded: '%I', hour_imperical_blank: '%l', ampm: '%P', meridian: '%P',
    minute: '%M', second: '%S', time_zone: '%z', time_zone_offset: '%:z', time_padded: '%H:%M',
    time_zone_offset_full: '%::z', time_zone_name: '%Z', date: '%B %-d, %Y', time_tzn: '%H:%M %Z',
    date_abbr: '%b %-d, %Y', date_iso: '%Y-%m-%d', datetime: '%B %-d, %Y %H:%M', time: '%H:%M',
    datetime_abbr: '%b %-d, %Y %H:%M', datetime_iso: '%Y-%m-%d %H:%M', time_imperical: '%I:%M %P',
    datetime_imperical: '%B %-d, %Y %I:%M %P', datetime_imperical_abbr: '%b %-d, %Y %I:%M %P',
    datetime_imperical_iso: '%Y-%m-%d %I:%M %P', datetime_tzn: '%B %-d, %Y %H:%M %Z',
    datetime_abbr_tzn: '%b %-d, %Y %H:%M %Z', datetime_iso_tzn: '%Y-%m-%d %H:%M %z',
    datetime_imperical_tzn: '%B %-d, %Y %I:%M %P %Z', day: '%B %-d', day_abbr: '%b %-d',
    datetime_imperical_abbr_tzn: '%b %-d, %Y %I:%M %P %Z', time_tz: '%H:%M %z', time_blank: '%k:%M',
    datetime_imperical_iso_tzn: '%Y-%m-%d %I:%M %P %z', day_iso: '%m-%d', daytime: '%B %-d %H:%M',
    daytime_abbr: '%b %-d %H:%M', daytime_iso: '%m-%d %H:%M', daytime_imperical: '%B %-d %I:%M %P',
    daytime_imperical_abbr: '%b %-d %I:%M %P', daytime_imperical_iso: '%m-%d %I:%M %P',
    time_imperical_padded: '%I:%M %P', time_imperical_blank: '%l:%M %P',
    time_imperical_tz: '%I:%M %P %z', time_imperical_tzn: '%I:%M %P %Z', sunday_week: '%U',
    monday_week: '%W', week_iso: '%V', week_year_iso: '%V-%G'
  }.freeze
  STRING_UNITS ||= {
    d: 'd', day: 'd', day_padded: 'd', dd: '-d', Day: '-d', day_unpadded: '-d', ddd: '_d', zz: ':z',
    DAY: '_d', day_blank: '_d', dddd: 'j', day_of_the_year: 'j', m: 'm', month: 'm', hhhh: 'l',
    month_padded: 'm', mm: '-m', Month: '-m', month_unpadded: '-m', mmm: '_m', MONTH: '_m',
    month_blank: '_m', mmmm: 'B', month_name: 'B', mmmmm: 'b', month_name_abbr: 'b', w: 'u', z: 'z',
    weekday: 'u', ww: 'w', weekday_offset: 'w', www: 'A', weekday_name: 'A', wwww: 'a', yyyy: 'Y',
    weekday_name_abbr: 'a', yy: 'y', yr: 'y', year: 'Y', h: 'H', hour: 'H', hour_padded: 'H',
    hh: 'k', HOUR: 'k', hour_blank: 'k', hhh: 'I', hour_imperical: 'I', hour_imperical_padded: 'I',
    HOUR_IMPERICAL: 'l', hour_imperical_blank: 'l', ampm: 'P', meridian: 'P', AMPM: 'p',
    MERIDIAN: 'p', n: 'M', minute: 'M', s: 'S', second: 'S', time_zone: 'z', time_zone_offset: ':z',
    zzz: '::z', time_zone_offset_full: '::z', zzzz: 'Z', time_zone_name: 'Z', swe: 'U',
    sunday_week: 'U', mwe: 'W', monday_week: 'W', we: 'V', week: 'V'
  }.freeze

  def count_centuries_since(time)
    count_seconds_since(time) / CENTURY
  end

  alias_method :count_centuries_until, :count_centuries_since

  def count_days_since(time)
    count_seconds_since(time) / DAY
  end

  alias_method :count_days_until, :count_days_since

  def count_decades_since(time)
    count_seconds_since(time) / DECADE
  end

  alias_method :count_decades_until, :count_decades_since

  def count_hours_since(time)
    count_seconds_since(time) / HOUR
  end

  alias_method :count_hours_until, :count_hours_since

  def count_milleniums_since(time)
    count_seconds_since(time) / MILLENNIUM
  end

  alias_method :count_milleniums_until, :count_milleniums_since

  def count_minutes_since(time)
    count_seconds_since(time) / MINUTE
  end

  alias_method :count_minutes_until, :count_minutes_since

  def count_seconds_since(time)
    time = time.to_time if time.respond_to?(:to_time)
    (to_f - time.to_f).abs
  end

  alias_method :count_seconds_until, :count_seconds_since

  def count_weeks_since(time)
    count_seconds_since(time) / WEEK
  end

  alias_method :count_weeks_until, :count_weeks_since

  def count_years_since(time)
    count_seconds_since(time) / YEAR
  end

  alias_method :count_years_until, :count_years_since

  def format(string)
    delimiters = string.scan(/\W+/)
    formatters = string.scan(/[a-z0-9_]+/i)

    string = formatters.map { |unit| "%#{STRING_UNITS.fetch(unit.to_sym)}#{delimiters.shift}" }

    strftime(string.join)
  end

  def to_format(key = :datetime_iso)
    strftime(KEY_UNITS.fetch(key.to_sym))
  end

  alias_method :stamp, :to_format

end

Time.include(ActiveObject::Time) if ActiveObject.configuration.autoload_time
