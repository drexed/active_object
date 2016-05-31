module ActiveObject::Date

  STRING_UNITS = {
    d: "d", day: "d", day_padded: "d", dd: "-d", Day: "-d", day_unpadded: "-d",
    ddd: "_d", DAY: "_d", day_blank: "_d", dddd: "j", day_of_the_year: "j",
    m: "m", month: "m", month_padded: "m", mm: "-m", Month: "-m",
    month_unpadded: "-m", mmm: "_m", MONTH: "_m", month_blank: "_m", mmmm: "B",
    month_name: "B", mmmmm: "b", month_name_abbr: "b", w: "u", weekday: "u",
    ww: "w", weekday_offset: "w", www: "A", weekday_name: "A", wwww: "a",
    weekday_name_abbr: "a", wwwww: "W", week: "W", wwwwww: "U", week_offset: "U",
    yy: "y", yr: "y", yyyy: "Y", year: "Y"
  }
  KEY_UNITS = {
    month: "%m", month_padded: "%m", month_unpadded: "%-m", month_blank: "%_m",
    month_name: "%B", month_name_abbr: "%b", month_year: "%m %Y",
    month_padded_year: "%m %Y", month_unpadded_year: "%-m %Y",
    month_blank_year: "%_m %Y", month_name_year: "%B %Y",
    month_name_abbr_year: "%b %Y", weekday: "%d", weekday_padded: "%d",
    weekday_unpadded: "%-d", weekday_blank: "%_d", weekday_name: "%A",
    weekday_name_abbr: "%a", yr: "%y", year_abbr: "%y", year: "%Y",
    date: "%B %-d, %Y", date_abbr:"%b %-d, %Y", date_iso: "%Y-%m-%d",
    day: "%B %-d", day_abbr: "%b %-d", day_iso: "%m-%d"
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

Date.send(:include, ActiveObject::Date) if ActiveObject.configuration.date
