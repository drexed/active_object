module ActiveObject::Time

  KEY_UNITS = {
    month: "%m", month_padded: "%m", month_unpadded: "%-m", month_blank: "%_m",
    month_name: "%B", month_name_abbr: "%b", month_year: "%m %Y",
    month_padded_year: "%m %Y", month_unpadded_year: "%-m %Y",
    month_blank_year: "%_m %Y", month_name_year: "%B %Y",
    month_name_abbr_year: "%b %Y", weekday: "%d", weekday_padded: "%d",
    weekday_unpadded: "%-d", weekday_blank: "%_d", weekday_name: "%A",
    weekday_name_abbr: "%a", yr: "%y", year_abbr: "%y", year: "%Y", hour: "%H",
    hour_padded: "%H", hour_blank: "%k", hour_imperical: "%I",
    hour_imperical_padded: "%I", hour_imperical_blank: "%l", ampm: "%P",
    meridian: "%P", minute: "%M", second: "%S", time_zone: "%z",
    time_zone_offset: "%:z", time_zone_offset_full: "%::z", time_zone_name: "%Z",
    date: "%B %-d, %Y", date_abbr:"%b %-d, %Y", date_iso: "%Y-%m-%d",
    datetime: "%B %-d, %Y %H:%M", datetime_abbr: "%b %-d, %Y %H:%M",
    datetime_iso: "%Y-%m-%d %H:%M", datetime_imperical: "%B %-d, %Y %I:%M %P",
    datetime_imperical_abbr: "%b %-d, %Y %I:%M %P", datetime_imperical_iso: "%Y-%m-%d %I:%M %P",
    datetime_tzn: "%B %-d, %Y %H:%M %Z", datetime_abbr_tzn: "%b %-d, %Y %H:%M %Z",
    datetime_iso_tzn: "%Y-%m-%d %H:%M %z", datetime_imperical_tzn: "%B %-d, %Y %I:%M %P %Z",
    datetime_imperical_abbr_tzn: "%b %-d, %Y %I:%M %P %Z", datetime_imperical_iso_tzn: "%Y-%m-%d %I:%M %P %z",
    day: "%B %-d", day_abbr: "%b %-d", day_iso: "%m-%d", daytime: "%B %-d %H:%M",
    daytime_abbr: "%b %-d %H:%M", daytime_iso: "%m-%d %H:%M",
    daytime_imperical: "%B %-d %I:%M %P", daytime_imperical_abbr: "%b %-d %I:%M %P",
    daytime_imperical_iso: "%m-%d %I:%M %P", time: "%H:%M", time_padded: "%H:%M",
    time_blank: "%k:%M", time_tz: "%H:%M %z", time_tzn: "%H:%M %Z",
    time_imperical: "%I:%M %P", time_imperical_padded: "%I:%M %P",
    time_imperical_blank: "%l:%M %P", time_imperical_tz: "%I:%M %P %z",
    time_imperical_tzn: "%I:%M %P %Z"
  }
  STRING_UNITS = {
    d: "d", day: "d", day_padded: "d", dd: "-d", Day: "-d", day_unpadded: "-d",
    ddd: "_d", DAY: "_d", day_blank: "_d", dddd: "j", day_of_the_year: "j",
    m: "m", month: "m", month_padded: "m", mm: "-m", Month: "-m",
    month_unpadded: "-m", mmm: "_m", MONTH: "_m", month_blank: "_m", mmmm: "B",
    month_name: "B", mmmmm: "b", month_name_abbr: "b", w: "u", weekday: "u",
    ww: "w", weekday_offset: "w", www: "A", weekday_name: "A", wwww: "a",
    weekday_name_abbr: "a", wwwww: "W", week: "W", wwwwww: "U", week_offset: "U",
    yy: "y", yr: "y", yyyy: "Y", year: "Y", h: "H", hour: "H", hour_padded: "H",
    hh: "k", HOUR: "k", hour_blank: "k", hhh: "I", hour_imperical: "I",
    hour_imperical_padded: "I", hhhh: "l", HOUR_IMPERICAL: "l",
    hour_imperical_blank: "l", ampm: "P", meridian: "P", AMPM: "p",
    MERIDIAN: "p", n: "M", minute: "M", s: "S", second: "S", z: "z",
    time_zone: "z", zz: ":z", time_zone_offset: ":z", zzz: "::z",
    time_zone_offset_full: "::z", zzzz: "Z", time_zone_name: "Z"
  }

  def format(string)
    delimiters = string.scan(/\W+/)
    formatters = string.scan(/[a-z0-9_]+/i)

    string = formatters.map do |unit|
      "%#{STRING_UNITS.fetch(unit.to_sym)}#{delimiters.shift || ''}"
    end

    strftime(string.join)
  end

  def to_format(key=:datetime_iso)
    strftime(KEY_UNITS.fetch(key.to_sym))
  end

  alias_method :stamp, :to_format

end

Time.send(:include, ActiveObject::Time) if ActiveObject.configuration.autoload_time