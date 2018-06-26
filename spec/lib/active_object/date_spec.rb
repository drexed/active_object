# frozen_string_literal: true

require 'spec_helper'

describe ActiveObject::Date do

  describe '#format' do
    date = Date.parse('2014-01-09')

    context '#day' do
      it 'to be "01"' do
        expect(date.format('d')).to eq('09')
        expect(date.format('day')).to eq('09')
        expect(date.format('day_padded')).to eq('09')
      end

      it 'to be "1"' do
        expect(date.format('dd')).to eq('9')
        expect(date.format('Day')).to eq('9')
        expect(date.format('day_unpadded')).to eq('9')
      end

      it 'to be " 1"' do
        expect(date.format('ddd')).to eq(' 9')
        expect(date.format('DAY')).to eq(' 9')
        expect(date.format('day_blank')).to eq(' 9')
      end

      it 'to be "009"' do
        expect(date.format('dddd')).to eq('009')
        expect(date.format('day_of_the_year')).to eq('009')
      end
    end

    context '#month' do
      it 'to be "01"' do
        expect(date.format('m')).to eq('01')
        expect(date.format('month')).to eq('01')
        expect(date.format('month_padded')).to eq('01')
      end

      it 'to be "1"' do
        expect(date.format('mm')).to eq('1')
        expect(date.format('Month')).to eq('1')
        expect(date.format('month_unpadded')).to eq('1')
      end

      it 'to be " 1"' do
        expect(date.format('mmm')).to eq(' 1')
        expect(date.format('MONTH')).to eq(' 1')
        expect(date.format('month_blank')).to eq(' 1')
      end

      it 'to be "January"' do
        expect(date.format('mmmm')).to eq('January')
        expect(date.format('month_name')).to eq('January')
      end

      it 'to be "Jan"' do
        expect(date.format('mmmmm')).to eq('Jan')
        expect(date.format('month_name_abbr')).to eq('Jan')
      end
    end

    context '#weekday' do
      it 'to be "4"' do
        expect(date.format('w')).to eq('4')
        expect(date.format('weekday')).to eq('4')
      end

      it 'to be "4"' do
        expect(date.format('ww')).to eq('4')
        expect(date.format('weekday_offset')).to eq('4')
      end

      it 'to be "Thursday"' do
        expect(date.format('www')).to eq('Thursday')
        expect(date.format('weekday_name')).to eq('Thursday')
      end

      it 'to be "Thu"' do
        expect(date.format('wwww')).to eq('Thu')
        expect(date.format('weekday_name_abbr')).to eq('Thu')
      end
    end

    context '#year' do
      it 'to be "2014"' do
        expect(date.format('yyyy')).to eq('2014')
        expect(date.format('year')).to eq('2014')
      end

      it 'to be "14"' do
        expect(date.format('yy')).to eq('14')
        expect(date.format('yr')).to eq('14')
      end
    end

    context '#week' do
      it 'to be "01"' do
        expect(date.format('mwe')).to eq('01')
        expect(date.format('monday_week')).to eq('01')
      end

      it 'to be "01"' do
        expect(date.format('swe')).to eq('01')
        expect(date.format('sunday_week')).to eq('01')
      end

      it 'to be "02"' do
        expect(date.format('we')).to eq('02')
        expect(date.format('week')).to eq('02')
      end
    end

    context 'chaining' do
      it 'to be "1 09, 2014"' do
        expect(date.format('month_unpadded day, year')).to eq('1 09, 2014')
      end
    end
  end

  describe '#to_format' do
    date = Time.parse('2014-01-09 00:31:58 UTC')

    context '#day' do
      it 'to be "January 9"' do
        expect(date.to_format(:day)).to eq('January 9')
      end

      it 'to be "Jan 9"' do
        expect(date.to_format(:day_abbr)).to eq('Jan 9')
      end

      it 'to be "01-09"' do
        expect(date.to_format(:day_iso)).to eq('01-09')
      end
    end

    context '#date' do
      it 'to be "January 9, 2014"' do
        expect(date.to_format(:date)).to eq('January 9, 2014')
      end

      it 'to be "Jan 9, 2014"' do
        expect(date.to_format(:date_abbr)).to eq('Jan 9, 2014')
      end

      it 'to be "2014-01-09"' do
        expect(date.to_format(:date_iso)).to eq('2014-01-09')
      end
    end

    context '#month' do
      it 'to be "01"' do
        expect(date.to_format(:month)).to eq('01')
        expect(date.to_format(:month_padded)).to eq('01')
      end

      it 'to be "1"' do
        expect(date.to_format(:month_unpadded)).to eq('1')
      end

      it 'to be " 1"' do
        expect(date.to_format(:month_blank)).to eq(' 1')
      end

      it 'to be "January"' do
        expect(date.to_format(:month_name)).to eq('January')
      end

      it 'to be "Jan"' do
        expect(date.to_format(:month_name_abbr)).to eq('Jan')
      end

      it 'to be "01 2014"' do
        expect(date.to_format(:month_year)).to eq('01 2014')
        expect(date.to_format(:month_padded_year)).to eq('01 2014')
      end

      it 'to be "1 2014"' do
        expect(date.to_format(:month_unpadded_year)).to eq('1 2014')
      end

      it 'to be " 1 2014"' do
        expect(date.to_format(:month_blank_year)).to eq(' 1 2014')
      end

      it 'to be "January 2014"' do
        expect(date.to_format(:month_name_year)).to eq('January 2014')
      end

      it 'to be "Jan 2014"' do
        expect(date.to_format(:month_name_abbr_year)).to eq('Jan 2014')
      end
    end

    context '#weekday' do
      it 'to be 09' do
        expect(date.to_format(:weekday)).to eq('09')
        expect(date.to_format(:weekday_padded)).to eq('09')
      end

      it 'to be 9' do
        expect(date.to_format(:weekday_unpadded)).to eq('9')
      end

      it 'to be _9' do
        expect(date.to_format(:weekday_blank)).to eq(' 9')
      end

      it 'to be Thursday' do
        expect(date.to_format(:weekday_name)).to eq('Thursday')
      end

      it 'to be Thu' do
        expect(date.to_format(:weekday_name_abbr)).to eq('Thu')
      end
    end

    context '#year' do
      it 'to be 14' do
        expect(date.to_format(:yr)).to eq('14')
      end

      it 'to be 2014' do
        expect(date.to_format(:year)).to eq('2014')
      end

      it 'to be "2014-01-09"' do
        expect(date.to_format(:year_day)).to eq('2014-01-09')
      end

      it 'to be "2014-02"' do
        expect(date.to_format(:year_week)).to eq('2014-02')
      end

      it 'to be "2014-01"' do
        expect(date.to_format(:year_month)).to eq('2014-01')
      end
    end

    context '#week' do
      it 'to be "01"' do
        expect(date.to_format(:monday_week)).to eq('01')
      end

      it 'to be "01"' do
        expect(date.to_format(:sunday_week)).to eq('01')
      end

      it 'to be "02"' do
        expect(date.to_format(:week_iso)).to eq('02')
      end

      it 'to be "02-2014"' do
        expect(date.to_format(:week_year_iso)).to eq('02-2014')
      end
    end
  end

  describe '#stamp' do
    date = Date.parse('2014-01-09')

    context '#year' do
      it 'to be 14' do
        expect(date.stamp(:yr)).to eq('14')
      end

      it 'to be 2014' do
        expect(date.stamp(:year)).to eq('2014')
      end
    end
  end

  describe '#difference' do
    past_date = Date.parse('2014-01-09')
    future_date = Date.parse('2015-01-10')

    context '#count_seconds_since' do
      it 'to be 31622400.0' do
        expect(future_date.count_seconds_since(past_date)).to eq(31622400.0)
        expect(past_date.count_seconds_since(future_date)).to eq(31622400.0)
      end
    end

    context '#count_minutes_since' do
      it 'to be 527040.0' do
        expect(future_date.count_minutes_since(past_date)).to eq(527040.0)
        expect(past_date.count_minutes_since(future_date)).to eq(527040.0)
      end
    end

    context '#count_hours_since' do
      it 'to be 8784.0' do
        expect(future_date.count_hours_since(past_date)).to eq(8784.0)
        expect(past_date.count_hours_since(future_date)).to eq(8784.0)
      end
    end

    context '#count_days_since' do
      it 'to be 366.0' do
        expect(future_date.count_days_since(past_date)).to eq(366.0)
        expect(past_date.count_days_since(future_date)).to eq(366.0)
      end
    end

    context '#count_weeks_since' do
      it 'to be 52.285714285714285' do
        expect(future_date.count_weeks_since(past_date)).to eq(52.285714285714285)
        expect(past_date.count_weeks_since(future_date)).to eq(52.285714285714285)
      end
    end

    context '#count_years_since' do
      it 'to be 1.002053388090349' do
        expect(future_date.count_years_since(past_date)).to eq(1.002053388090349)
        expect(past_date.count_years_since(future_date)).to eq(1.002053388090349)
      end
    end

    context '#count_decades_since' do
      it 'to be 0.10020533880903491' do
        expect(future_date.count_decades_since(past_date)).to eq(0.10020533880903491)
        expect(past_date.count_decades_since(future_date)).to eq(0.10020533880903491)
      end
    end

    context '#count_centuries_since' do
      it 'to be 0.01002053388090349' do
        expect(future_date.count_centuries_since(past_date)).to eq(0.01002053388090349)
        expect(past_date.count_centuries_since(future_date)).to eq(0.01002053388090349)
      end
    end

    context '#count_milleniums_since' do
      it 'to be 0.001002053388090349' do
        expect(future_date.count_milleniums_since(past_date)).to eq(0.001002053388090349)
        expect(past_date.count_milleniums_since(future_date)).to eq(0.001002053388090349)
      end
    end
  end

end
