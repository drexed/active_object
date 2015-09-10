class Date

  def format(string)
    delimiters = string.scan /\W+/
    formatters = string.scan /[a-z0-9_]+/i

    format_units = {
      "d"                     => "d",
      "day"                   => "d",
      "day_padded"            => "d",
      "dd"                    => "-d",
      "Day"                   => "-d",
      "day_unpadded"          => "-d",
      "ddd"                   => "_d",
      "DAY"                   => "_d",
      "day_blank"             => "_d",
      "dddd"                  => "j",
      "day_of_the_year"       => "j",
      "m"                     => "m",
      "month"                 => "m",
      "month_padded"          => "m",
      "mm"                    => "-m",
      "Month"                 => "-m",
      "month_unpadded"        => "-m",
      "mmm"                   => "_m",
      "MONTH"                 => "_m",
      "month_blank"           => "_m",
      "mmmm"                  => "B",
      "month_name"            => "B",
      "mmmmm"                 => "b",
      "month_name_abbr"       => "b",
      "w"                     => "u",
      "weekday"               => "u",
      "ww"                    => "w",
      "weekday_offset"        => "w",
      "www"                   => "A",
      "weekday_name"          => "A",
      "wwww"                  => "a",
      "weekday_name_abbr"     => "a",
      "wwwww"                 => "W",
      "week"                  => "W",
      "wwwwww"                => "U",
      "week_offset"           => "U",
      "yy"                    => "y",
      "yr"                    => "y",
      "yyyy"                  => "Y",
      "year"                  => "Y",
      "ampm"                  => "P",
      "meridian"              => "P",
      "AMPM"                  => "p",
      "MERIDIAN"              => "p"
    }

    strftime(formatters.map { |f| "%#{format_units.fetch(f)}#{delimiters.shift || ''}" }.join(""))
  end

  def to_format(key)
    format_units = {
      month:                       "%m",
      month_padded:                "%m",
      month_unpadded:              "%-m",
      month_blank:                 "%_m",
      month_name:                  "%B",
      month_name_abbr:             "%b",
      weekday:                     "%d",
      weekday_padded:              "%d",
      weekday_unpadded:            "%-d",
      weekday_blank:               "%_d",
      weekday_name:                "%A",
      weekday_name_abbr:           "%a",
      yr:                          "%y",
      year_abbr:                   "%y",
      year:                        "%Y",
      date:                        "%B %-d, %Y",
      date_abbr:                   "%b %-d, %Y",
      date_iso:                    "%Y-%m-%d",
      datetime:                    "%B %-d, %Y %H:%M",
      datetime_abbr:               "%b %-d, %Y %H:%M",
      datetime_iso:                "%Y-%m-%d %H:%M",
      datetime_imperical:          "%B %-d, %Y %I:%M %P",
      datetime_imperical_abbr:     "%b %-d, %Y %I:%M %P",
      datetime_imperical_iso:      "%Y-%m-%d %I:%M %P",
      datetime_tzn:                "%B %-d, %Y %H:%M %Z",
      datetime_abbr_tzn:           "%b %-d, %Y %H:%M %Z",
      datetime_iso_tzn:            "%Y-%m-%d %H:%M %z",
      datetime_imperical_tzn:      "%B %-d, %Y %I:%M %P %Z",
      datetime_imperical_abbr_tzn: "%b %-d, %Y %I:%M %P %Z",
      datetime_imperical_iso_tzn:  "%Y-%m-%d %I:%M %P %z",
      day:                         "%B %-d",
      day_abbr:                    "%b %-d",
      day_iso:                     "%m-%d",
      daytime:                     "%B %-d %H:%M",
      daytime_abbr:                "%b %-d %H:%M",
      daytime_iso:                 "%m-%d %H:%M",
      daytime_imperical:           "%B %-d %I:%M %P",
      daytime_imperical_abbr:      "%b %-d %I:%M %P",
      daytime_imperical_iso:       "%m-%d %I:%M %P"
    }

    strftime(format_units.fetch(key))
  end

  alias_method :stamp, :to_format

end