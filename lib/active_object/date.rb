# frozen_string_literal: true

require 'date'

module ActiveObject
  module Date
    MINUTE ||= 60.0
    HOUR ||= MINUTE * 60.0
    DAY ||= HOUR * 24.0
    WEEK ||= DAY * 7.0
    YEAR ||= DAY * 365.25
    DECADE ||= YEAR * 10.0
    CENTURY ||= DECADE * 10.0
    MILLENNIUM ||= CENTURY * 10.0

    KEY_UNITS ||= {
      month: '%m',
      month_padded: '%m',
      month_unpadded: '%-m',
      month_blank: '%_m',
      month_name: '%B',
      month_name_abbr: '%b',
      month_year: '%m %Y',
      month_padded_year: '%m %Y',
      month_unpadded_year: '%-m %Y',
      month_blank_year: '%_m %Y',
      month_name_year: '%B %Y',
      month_name_abbr_year: '%b %Y',
      weekday: '%d',
      weekday_padded: '%d',
      weekday_unpadded: '%-d',
      weekday_blank: '%_d',
      weekday_name: '%A',
      weekday_name_abbr: '%a',
      sunday_week: '%U',
      monday_week: '%W',
      week_iso: '%V',
      week_year_iso: '%V-%G',
      date: '%B %-d, %Y',
      date_abbr: '%b %-d, %Y',
      date_iso: '%Y-%m-%d',
      day: '%B %-d',
      day_abbr: '%b %-d',
      day_iso: '%m-%d',
      yr: '%y',
      year_abbr: '%y',
      year: '%Y',
      year_day: '%Y-%m-%d',
      year_month: '%Y-%m',
      year_week: '%G-%V'
    }.freeze

    STRING_UNITS ||= {
      m: 'm',
      month: 'm',
      month_padded: 'm',
      mm: '-m',
      Month: '-m',
      month_unpadded: '-m',
      mmm: '_m',
      MONTH: '_m',
      month_blank: '_m',
      mmmm: 'B',
      month_name: 'B',
      mmmmm: 'b',
      month_name_abbr: 'b',
      swe: 'U',
      sunday_week: 'U',
      mwe: 'W',
      monday_week: 'W',
      we: 'V',
      week: 'V',
      w: 'u',
      weekday: 'u',
      ww: 'w',
      weekday_offset: 'w',
      www: 'A',
      weekday_name: 'A',
      wwww: 'a',
      weekday_name_abbr: 'a',
      d: 'd',
      day: 'd',
      day_padded: 'd',
      dd: '-d',
      Day: '-d',
      day_unpadded: '-d',
      ddd: '_d',
      DAY: '_d',
      day_blank: '_d',
      dddd: 'j',
      day_of_the_year: 'j',
      yy: 'y',
      yr: 'y',
      yyyy: 'Y',
      year: 'Y'
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
      (to_time.to_f - time.to_time.to_f).abs
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
end

Date.include(ActiveObject::Date) if ActiveObject.configuration.autoload_date
