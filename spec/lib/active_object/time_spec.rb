require 'spec_helper'

describe ActiveObject::Time do

  describe '#format' do
    datetime = Time.parse('2014-01-09 00:31:58 UTC')

    context '#day' do
      it 'to be 01' do
        expect(datetime.format('d')).to eq('09')
        expect(datetime.format('day')).to eq('09')
        expect(datetime.format('day_padded')).to eq('09')
      end

      it 'to be "1"' do
        expect(datetime.format('dd')).to eq('9')
        expect(datetime.format('Day')).to eq('9')
        expect(datetime.format('day_unpadded')).to eq('9')
      end

      it 'to be " 1"' do
        expect(datetime.format('ddd')).to eq(' 9')
        expect(datetime.format('DAY')).to eq(' 9')
        expect(datetime.format('day_blank')).to eq(' 9')
      end

      it 'to be "009"' do
        expect(datetime.format('dddd')).to eq('009')
        expect(datetime.format('day_of_the_year')).to eq('009')
      end
    end

    context '#hour' do
      it 'to be "00"' do
        expect(datetime.format('h')).to eq('00')
        expect(datetime.format('hour')).to eq('00')
        expect(datetime.format('hour_padded')).to eq('00')
      end

      it 'to be "_0"' do
        expect(datetime.format('hh')).to eq(' 0')
        expect(datetime.format('HOUR')).to eq(' 0')
        expect(datetime.format('hour_blank')).to eq(' 0')
      end

      it 'to be "12"' do
        expect(datetime.format('hhh')).to eq('12')
        expect(datetime.format('hour_imperical')).to eq('12')
        expect(datetime.format('hour_imperical_padded')).to eq('12')
      end

      it 'to be "12"' do
        expect(datetime.format('hhhh')).to eq('12')
        expect(datetime.format('HOUR_IMPERICAL')).to eq('12')
        expect(datetime.format('hour_imperical_blank')).to eq('12')
      end
    end

    context '#meridian' do
      it 'to be "am"' do
        expect(datetime.format('ampm')).to eq('am')
        expect(datetime.format('meridian')).to eq('am')
      end

      it 'to be "AM"' do
        expect(datetime.format('AMPM')).to eq('AM')
        expect(datetime.format('MERIDIAN')).to eq('AM')
      end
    end

    context '#minute' do
      it 'to be "31"' do
        expect(datetime.format('n')).to eq('31')
        expect(datetime.format('minute')).to eq('31')
      end
    end

    context '#month' do
      it 'to be "01"' do
        expect(datetime.format('m')).to eq('01')
        expect(datetime.format('month')).to eq('01')
        expect(datetime.format('month_padded')).to eq('01')
      end

      it 'to be "1"' do
        expect(datetime.format('mm')).to eq('1')
        expect(datetime.format('Month')).to eq('1')
        expect(datetime.format('month_unpadded')).to eq('1')
      end

      it 'to be " 1"' do
        expect(datetime.format('mmm')).to eq(' 1')
        expect(datetime.format('MONTH')).to eq(' 1')
        expect(datetime.format('month_blank')).to eq(' 1')
      end

      it 'to be "January"' do
        expect(datetime.format('mmmm')).to eq('January')
        expect(datetime.format('month_name')).to eq('January')
      end

      it 'to be "Jan"' do
        expect(datetime.format('mmmmm')).to eq('Jan')
        expect(datetime.format('month_name_abbr')).to eq('Jan')
      end
    end

    context '#second' do
      it 'to be "58"' do
        expect(datetime.format('s')).to eq('58')
        expect(datetime.format('second')).to eq('58')
      end
    end

    context '#time zone' do
      it 'to be "+0000"' do
        expect(datetime.format('z')).to eq('+0000')
        expect(datetime.format('time_zone')).to eq('+0000')
      end

      it 'to be "+00:00"' do
        expect(datetime.format('zz')).to eq('+00:00')
        expect(datetime.format('time_zone_offset')).to eq('+00:00')
      end

      it 'to be "+00:00:00"' do
        expect(datetime.format('zzz')).to eq('+00:00:00')
        expect(datetime.format('time_zone_offset_full')).to eq('+00:00:00')
      end

      it 'to be "UTC"' do
        expect(datetime.format('zzzz')).to eq('UTC')
        expect(datetime.format('time_zone_name')).to eq('UTC')
      end
    end

    context '#week' do
      it 'to be "01"' do
        expect(datetime.format('wwwww')).to eq('01')
        expect(datetime.format('week')).to eq('01')
      end

      it 'to be "01"' do
        expect(datetime.format('wwwwww')).to eq('01')
        expect(datetime.format('week_offset')).to eq('01')
      end
    end

    context '#weekday' do
      it 'to be "4"' do
        expect(datetime.format('w')).to eq('4')
        expect(datetime.format('weekday')).to eq('4')
      end

      it 'to be "4"' do
        expect(datetime.format('ww')).to eq('4')
        expect(datetime.format('weekday_offset')).to eq('4')
      end

      it 'to be "Thursday"' do
        expect(datetime.format('www')).to eq('Thursday')
        expect(datetime.format('weekday_name')).to eq('Thursday')
      end

      it 'to be "Thu"' do
        expect(datetime.format('wwww')).to eq('Thu')
        expect(datetime.format('weekday_name_abbr')).to eq('Thu')
      end
    end

    context '#year' do
      it 'to be "2014"' do
        expect(datetime.format('yyyy')).to eq('2014')
        expect(datetime.format('year')).to eq('2014')
      end

      it 'to be "14"' do
        expect(datetime.format('yy')).to eq('14')
        expect(datetime.format('yr')).to eq('14')
      end
    end

    context 'chaining' do
      it 'to be "1 09, 2014"' do
        expect(datetime.format('month_unpadded day, year')).to eq('1 09, 2014')
      end

      it 'to be "00:31 am"' do
        expect(datetime.format('hour:minute ampm')).to eq('00:31 am')
      end

      it 'to be "January 9, 2014 12:31 am +0000"' do
        expect(datetime.format('month_name day_unpadded, year hour_imperical:minute ampm time_zone')).to eq('January 9, 2014 12:31 am +0000')
      end
    end
  end

  describe '#to_format' do
    datetime = Time.parse('2014-01-09 00:31:58 UTC')

    context '#day' do
      it 'to be "January 9"' do
        expect(datetime.to_format(:day)).to eq('January 9')
      end

      it 'to be "Jan 9"' do
        expect(datetime.to_format(:day_abbr)).to eq('Jan 9')
      end

      it 'to be "01-09"' do
        expect(datetime.to_format(:day_iso)).to eq('01-09')
      end
    end

    context '#date' do
      it 'to be "January 9, 2014"' do
        expect(datetime.to_format(:date)).to eq('January 9, 2014')
      end

      it 'to be "Jan 9, 2014"' do
        expect(datetime.to_format(:date_abbr)).to eq('Jan 9, 2014')
      end

      it 'to be "2014-01-09"' do
        expect(datetime.to_format(:date_iso)).to eq('2014-01-09')
      end
    end

    context '#datetime' do
      it 'to be "January 9, 2014 00:31"' do
        expect(datetime.to_format(:datetime)).to eq('January 9, 2014 00:31')
      end

      it 'to be "Jan 9, 2014 00:31"' do
        expect(datetime.to_format(:datetime_abbr)).to eq('Jan 9, 2014 00:31')
      end

      it 'to be "2014-01-09 00:31"' do
        expect(datetime.to_format(:datetime_iso)).to eq('2014-01-09 00:31')
      end

      it 'to be "January 9, 2014 12:31 am"' do
        expect(datetime.to_format(:datetime_imperical)).to eq('January 9, 2014 12:31 am')
      end

      it 'to be "Jan 9, 2014 12:31 am"' do
        expect(datetime.to_format(:datetime_imperical_abbr)).to eq('Jan 9, 2014 12:31 am')
      end

      it 'to be "2014-01-09 12:31 am"' do
        expect(datetime.to_format(:datetime_imperical_iso)).to eq('2014-01-09 12:31 am')
      end

      it 'to be "January 9, 2014 00:31 UTC"' do
        expect(datetime.to_format(:datetime_tzn)).to eq('January 9, 2014 00:31 UTC')
      end

      it 'to be "Jan 9, 2014 00:31 UTC"' do
        expect(datetime.to_format(:datetime_abbr_tzn)).to eq('Jan 9, 2014 00:31 UTC')
      end

      it 'to be "2014-01-09 00:31 UTC"' do
        expect(datetime.to_format(:datetime_iso_tzn)).to eq('2014-01-09 00:31 +0000')
      end

      it 'to be "January 9, 2014 12:31 am UTC"' do
        expect(datetime.to_format(:datetime_imperical_tzn)).to eq('January 9, 2014 12:31 am UTC')
      end

      it 'to be "Jan 9, 2014 12:31 am UTC"' do
        expect(datetime.to_format(:datetime_imperical_abbr_tzn)).to eq('Jan 9, 2014 12:31 am UTC')
      end

      it 'to be "2014-01-09 12:31 am UTC"' do
        expect(datetime.to_format(:datetime_imperical_iso_tzn)).to eq('2014-01-09 12:31 am +0000')
      end
    end

    context '#daytime' do
      it 'to be "January 9 00:31"' do
        expect(datetime.to_format(:daytime)).to eq('January 9 00:31')
      end

      it 'to be "Jan 9 00:31"' do
        expect(datetime.to_format(:daytime_abbr)).to eq('Jan 9 00:31')
      end

      it 'to be "01-09 00:31"' do
        expect(datetime.to_format(:daytime_iso)).to eq('01-09 00:31')
      end

      it 'to be "January 9 12:31 am"' do
        expect(datetime.to_format(:daytime_imperical)).to eq('January 9 12:31 am')
      end

      it 'to be "Jan 9 12:31 am"' do
        expect(datetime.to_format(:daytime_imperical_abbr)).to eq('Jan 9 12:31 am')
      end

      it 'to be "01-09 12:31 am"' do
        expect(datetime.to_format(:daytime_imperical_iso)).to eq('01-09 12:31 am')
      end
    end

    context '#hour' do
      it 'to be "00"' do
        expect(datetime.to_format(:hour)).to eq('00')
        expect(datetime.to_format(:hour_padded)).to eq('00')
      end

      it 'to be "_0"' do
        expect(datetime.to_format(:hour_blank)).to eq(' 0')
      end

      it 'to be "12"' do
        expect(datetime.to_format(:hour_imperical)).to eq('12')
        expect(datetime.to_format(:hour_imperical_padded)).to eq('12')
      end

      it 'to be "12"' do
        expect(datetime.to_format(:hour_imperical_blank)).to eq('12')
      end
    end

    context '#meridian' do
      it 'to be "am"' do
        expect(datetime.to_format(:ampm)).to eq('am')
        expect(datetime.to_format(:meridian)).to eq('am')
      end
    end

    context '#minute' do
      it 'to be "31"' do
        expect(datetime.to_format(:minute)).to eq('31')
      end
    end

    context '#month' do
      it 'to be "01"' do
        expect(datetime.to_format(:month)).to eq('01')
        expect(datetime.to_format(:month_padded)).to eq('01')
      end

      it 'to be "1"' do
        expect(datetime.to_format(:month_unpadded)).to eq('1')
      end

      it 'to be " 1"' do
        expect(datetime.to_format(:month_blank)).to eq(' 1')
      end

      it 'to be "January"' do
        expect(datetime.to_format(:month_name)).to eq('January')
      end

      it 'to be "Jan"' do
        expect(datetime.to_format(:month_name_abbr)).to eq('Jan')
      end

      it 'to be "01 2014"' do
        expect(datetime.to_format(:month_year)).to eq('01 2014')
        expect(datetime.to_format(:month_padded_year)).to eq('01 2014')
      end

      it 'to be "1 2014"' do
        expect(datetime.to_format(:month_unpadded_year)).to eq('1 2014')
      end

      it 'to be " 1 2014"' do
        expect(datetime.to_format(:month_blank_year)).to eq(' 1 2014')
      end

      it 'to be "January 2014"' do
        expect(datetime.to_format(:month_name_year)).to eq('January 2014')
      end

      it 'to be "Jan 2014"' do
        expect(datetime.to_format(:month_name_abbr_year)).to eq('Jan 2014')
      end
    end

    context '#second' do
      it 'to be "58"' do
        expect(datetime.to_format(:second)).to eq('58')
      end
    end

    context '#time' do
      it 'to be "00:31"' do
        expect(datetime.to_format(:time)).to eq('00:31')
        expect(datetime.to_format(:time_padded)).to eq('00:31')
      end

      it 'to be "00:31 +0000"' do
        expect(datetime.to_format(:time_tz)).to eq('00:31 +0000')
      end

      it 'to be "00:31 UTC"' do
        expect(datetime.to_format(:time_tzn)).to eq('00:31 UTC')
      end

      it 'to be " 0:31"' do
        expect(datetime.to_format(:time_blank)).to eq(' 0:31')
      end

      it 'to be "12:31"' do
        expect(datetime.to_format(:time_imperical)).to eq('12:31 am')
        expect(datetime.to_format(:time_imperical_padded)).to eq('12:31 am')
      end

      it 'to be "12:31 +0000"' do
        expect(datetime.to_format(:time_imperical_tz)).to eq('12:31 am +0000')
      end

      it 'to be "12:31 UTC"' do
        expect(datetime.to_format(:time_imperical_tzn)).to eq('12:31 am UTC')
      end

      it 'to be "12:31"' do
        expect(datetime.to_format(:time_imperical_blank)).to eq('12:31 am')
      end
    end

    context '#time zone' do
      it 'to be "+0000"' do
        expect(datetime.to_format(:time_zone)).to eq('+0000')
      end

      it 'to be "+00:00"' do
        expect(datetime.to_format(:time_zone_offset)).to eq('+00:00')
      end

      it 'to be "+00:00:00"' do
        expect(datetime.to_format(:time_zone_offset_full)).to eq('+00:00:00')
      end

      it 'to be "UTC"' do
        expect(datetime.to_format(:time_zone_name)).to eq('UTC')
      end
    end

    context '#weekday' do
      it 'to be "09"' do
        expect(datetime.to_format(:weekday)).to eq('09')
        expect(datetime.to_format(:weekday_padded)).to eq('09')
      end

      it 'to be "9"' do
        expect(datetime.to_format(:weekday_unpadded)).to eq('9')
      end

      it 'to be " 9"' do
        expect(datetime.to_format(:weekday_blank)).to eq(' 9')
      end

      it 'to be "Thursday"' do
        expect(datetime.to_format(:weekday_name)).to eq('Thursday')
      end

      it 'to be "Thu"' do
        expect(datetime.to_format(:weekday_name_abbr)).to eq('Thu')
      end
    end

    context '#year' do
      it 'to be "14"' do
        expect(datetime.to_format(:yr)).to eq('14')
      end

      it 'to be "2014"' do
        expect(datetime.to_format(:year)).to eq('2014')
      end
    end
  end

  describe '#stamp' do
    datetime = Time.parse('2014-01-09 00:31:58 UTC')

    context '#year' do
      it 'to be "14"' do
        expect(datetime.stamp(:yr)).to eq('14')
      end

      it 'to be "2014"' do
        expect(datetime.stamp(:year)).to eq('2014')
      end
    end
  end

  describe '#difference' do
    past_datetime = Time.parse('2014-01-09 00:31:58 UTC')
    future_datetime = Time.parse('2015-01-10 00:31:58 UTC')

    context '#count_seconds_since' do
      it 'to be 31622400.0' do
        expect(future_datetime.count_seconds_since(past_datetime)).to eq(31622400.0)
        expect(past_datetime.count_seconds_since(future_datetime)).to eq(31622400.0)
      end
    end

    context '#count_minutes_since' do
      it 'to be 527040.0' do
        expect(future_datetime.count_minutes_since(past_datetime)).to eq(527040.0)
        expect(past_datetime.count_minutes_since(future_datetime)).to eq(527040.0)
      end
    end

    context '#count_hours_since' do
      it 'to be 8784.0' do
        expect(future_datetime.count_hours_since(past_datetime)).to eq(8784.0)
        expect(past_datetime.count_hours_since(future_datetime)).to eq(8784.0)
      end
    end

    context '#count_days_since' do
      it 'to be 366.0' do
        expect(future_datetime.count_days_since(past_datetime)).to eq(366.0)
        expect(past_datetime.count_days_since(future_datetime)).to eq(366.0)
      end
    end

    context '#count_weeks_since' do
      it 'to be 52.285714285714285' do
        expect(future_datetime.count_weeks_since(past_datetime)).to eq(52.285714285714285)
        expect(past_datetime.count_weeks_since(future_datetime)).to eq(52.285714285714285)
      end
    end

    context '#count_years_since' do
      it 'to be 1.002053388090349' do
        expect(future_datetime.count_years_since(past_datetime)).to eq(1.002053388090349)
        expect(past_datetime.count_years_since(future_datetime)).to eq(1.002053388090349)
      end
    end

    context '#count_decades_since' do
      it 'to be 0.10020533880903491' do
        expect(future_datetime.count_decades_since(past_datetime)).to eq(0.10020533880903491)
        expect(past_datetime.count_decades_since(future_datetime)).to eq(0.10020533880903491)
      end
    end

    context '#count_centuries_since' do
      it 'to be 0.01002053388090349' do
        expect(future_datetime.count_centuries_since(past_datetime)).to eq(0.01002053388090349)
        expect(past_datetime.count_centuries_since(future_datetime)).to eq(0.01002053388090349)
      end
    end

    context '#count_milleniums_since' do
      it 'to be 0.001002053388090349' do
        expect(future_datetime.count_milleniums_since(past_datetime)).to eq(0.001002053388090349)
        expect(past_datetime.count_milleniums_since(future_datetime)).to eq(0.001002053388090349)
      end
    end
  end

end
