require 'spec_helper'

describe ActiveObject::Numeric do

  describe '#add' do
    it 'to be 6' do
      expect(4.add(2)).to eq(6)
    end
  end

  describe '#byte_in_bytes' do
    it 'to be 3' do
      expect(3.byte_in_bytes).to eq(3)
      expect(3.bytes_in_bytes).to eq(3)
    end
  end

  describe '#centigram_in_grams' do
    it 'to be 0.03' do
      expect(3.centigram_in_grams).to eq(0.03)
      expect(3.centigrams_in_grams).to eq(0.03)
    end
  end

  describe '#centimeter_in_meters' do
    it 'to be 0.03' do
      expect(3.centimeter_in_meters).to eq(0.03)
      expect(3.centimeters_in_meters).to eq(0.03)
    end
  end

  describe '#century_in_second' do
    it 'to be 259200' do
      expect(3.century_in_seconds).to eq(9467280000.0)
      expect(3.centuries_in_seconds).to eq(9467280000.0)
    end
  end

  describe '#clamp' do
    it 'to be 3' do
      expect(1.clamp(3, 6)).to eq(3)
      expect(1.clamp(3..6)).to eq(3)
    end

    it 'to be 5' do
      expect(5.clamp(3, 6)).to eq(5)
      expect(5.clamp(3..6)).to eq(5)
    end

    it 'to be 6' do
      expect(8.clamp(3, 6)).to eq(6)
      expect(8.clamp(3..6)).to eq(6)
    end
  end

  describe '#day_in_second' do
    it 'to be 259200' do
      expect(3.day_in_seconds).to eq(259200)
      expect(3.days_in_seconds).to eq(259200)
    end
  end

  describe '#decade_in_second' do
    it 'to be 259200' do
      expect(3.decade_in_seconds).to eq(946728000.0)
      expect(3.decades_in_seconds).to eq(946728000.0)
    end
  end

  describe '#decagram_in_grams' do
    it 'to be 30' do
      expect(3.decagram_in_grams).to eq(30)
      expect(3.decagrams_in_grams).to eq(30)
    end
  end

  describe '#decameter_in_meters' do
    it 'to be 30' do
      expect(3.decameter_in_meters).to eq(30)
      expect(3.decameters_in_meters).to eq(30)
    end
  end

  describe '#decigrams_in_grams' do
    it 'to be 0.3' do
      expect(3.decigram_in_grams).to eq(0.30000000000000004)
      expect(3.decigrams_in_grams).to eq(0.30000000000000004)
    end
  end

  describe '#decimeter_in_meters' do
    it 'to be 0.3' do
      expect(3.decimeter_in_meters).to eq(0.30000000000000004)
      expect(3.decimeters_in_meters).to eq(0.30000000000000004)
    end
  end

  describe '#decrement' do
    it 'to be 2' do
      expect(1.decrement).to eq(2)
    end

    it 'to be 1.5' do
      expect(1.decrement(0.5)).to eq(1.5)
    end
  end

  describe '#degrees_to_radians' do
    it 'to be 1.5707963267948966' do
      expect(90.degrees_to_radians).to eq(1.5707963267948966)
    end
  end

  describe '#distance' do
    it 'to be 2' do
      expect(5.distance(3)).to eq(2)
      expect(3.distance(5)).to eq(2)
    end
  end

  describe '#divide' do
    it 'to be 2' do
      expect(4.divide(2)).to eq(2)
    end
  end

  describe '#exabyte_in_bytes' do
    it 'to be 3458764513820540928' do
      expect(3.exabyte_in_bytes).to eq(3458764513820540928)
      expect(3.exabytes_in_bytes).to eq(3458764513820540928)
    end
  end

  describe '#feet_in_inches' do
    it 'to be 36' do
      expect(3.foot_in_inches).to eq(36)
      expect(3.feet_in_inches).to eq(36)
    end
  end

  describe '#gigabyte_in_bytes' do
    it 'to be 3221225472' do
      expect(3.gigabyte_in_bytes).to eq(3221225472)
      expect(3.gigabytes_in_bytes).to eq(3221225472)
    end
  end

  describe '#gram_in_grams' do
    it 'to be 300' do
      expect(3.gram_in_grams).to eq(3)
      expect(3.grams_in_grams).to eq(3)
    end
  end

  describe '#greater_than?' do
    it 'to be true' do
      expect(3.greater_than?(2)).to eq(true)
    end

    it 'to be false' do
      expect(3.greater_than?(3)).to eq(false)
      expect(3.greater_than?(4)).to eq(false)
    end
  end

  describe '#greater_than_or_equal_to?' do
    it 'to be true' do
      expect(3.greater_than_or_equal_to?(2)).to eq(true)
      expect(3.greater_than_or_equal_to?(3)).to eq(true)
    end

    it 'to be false' do
      expect(3.greater_than_or_equal_to?(4)).to eq(false)
    end
  end

  describe '#hectogram_in_grams' do
    it 'to be 300' do
      expect(3.hectogram_in_grams).to eq(300)
      expect(3.hectograms_in_grams).to eq(300)
    end
  end

  describe '#hectometer_in_meters' do
    it 'to be 300' do
      expect(3.hectometer_in_meters).to eq(300)
      expect(3.hectometers_in_meters).to eq(300)
    end
  end

  describe '#hour_in_second' do
    it 'to be 10800' do
      expect(3.hour_in_seconds).to eq(10800)
      expect(3.hours_in_seconds).to eq(10800)
    end
  end

  describe '#inch_in_inches' do
    it 'to be 3' do
      expect(3.inch_in_inches).to eq(3)
      expect(3.inches_in_inches).to eq(3)
    end
  end

  describe '#inside?' do
    it 'to be true' do
      expect(3.inside?(1, 5)).to eq(true)
    end

    it 'to be false' do
      expect(3.inside?(3, 5)).to eq(false)
    end
  end

  describe '#kilobytes_in_bytes' do
    it 'to be 3072' do
      expect(3.kilobyte_in_bytes).to eq(3072)
      expect(3.kilobytes_in_bytes).to eq(3072)
    end
  end

  describe '#kilograms_in_grams' do
    it 'to be 3000' do
      expect(3.kilogram_in_grams).to eq(3000)
      expect(3.kilograms_in_grams).to eq(3000)
    end
  end

  describe '#kilometer_in_meters' do
    it 'to be 3000' do
      expect(3.kilometer_in_meters).to eq(3000)
      expect(3.kilometers_in_meters).to eq(3000)
    end
  end

  describe '#less_than?' do
    it 'to be true' do
      expect(3.less_than?(4)).to eq(true)
    end

    it 'to be false' do
      expect(3.less_than?(3)).to eq(false)
      expect(3.less_than?(2)).to eq(false)
    end
  end

  describe '#less_than_or_equal_to?' do
    it 'to be true' do
      expect(3.less_than_or_equal_to?(4)).to eq(true)
      expect(3.less_than_or_equal_to?(3)).to eq(true)
    end

    it 'to be false' do
      expect(3.less_than_or_equal_to?(2)).to eq(false)
    end
  end

  describe '#metric_ton_in_grams' do
    it 'to be 3000000' do
      expect(3.metric_ton_in_grams).to eq(3000000)
      expect(3.metric_tons_in_grams).to eq(3000000)
    end
  end

  describe '#megabyte_in_bytes' do
    it 'to be 3145728' do
      expect(3.megabyte_in_bytes).to eq(3145728)
      expect(3.megabytes_in_bytes).to eq(3145728)
    end
  end

  describe '#meter_in_meters' do
    it 'to be 3' do
      expect(3.meter_in_meters).to eq(3)
      expect(3.meters_in_meters).to eq(3)
    end
  end

  describe '#mile_in_inches' do
    it 'to be 36' do
      expect(3.mile_in_inches).to eq(190080)
      expect(3.miles_in_inches).to eq(190080)
    end
  end

  describe '#millennium_in_second' do
    it 'to be 94672800000.0' do
      expect(3.millennium_in_seconds).to eq(94672800000.0)
      expect(3.millenniums_in_seconds).to eq(94672800000.0)
    end
  end

  describe '#milligrams_in_grams' do
    it 'to be 0.003' do
      expect(3.milligram_in_grams).to eq(0.003)
      expect(3.milligrams_in_grams).to eq(0.003)
    end
  end

  describe '#millimeter_in_meters' do
    it 'to be 0.003' do
      expect(3.millimeter_in_meters).to eq(0.003)
      expect(3.millimeters_in_meters).to eq(0.003)
    end
  end

  describe '#minute_in_second' do
    it 'to be 180' do
      expect(3.minute_in_seconds).to eq(180)
      expect(3.minutes_in_seconds).to eq(180)
    end
  end

  describe '#multiply' do
    it 'to be 8' do
      expect(4.multiply(2)).to eq(8)
    end
  end

  describe '#multiple_of?' do
    it 'to be true' do
      expect(9.multiple_of?(3)).to eq(true)
      expect(12.multiple_of?(3)).to eq(true)
    end

    it 'to be false' do
      expect(10.multiple_of?(3)).to eq(false)
    end
  end

  describe '#nautical_mile_in_inches' do
    it 'to be 218740.26239999998' do
      expect(3.nautical_mile_in_inches).to eq(218740.26239999998)
      expect(3.nautical_miles_in_inches).to eq(218740.26239999998)
    end
  end

  describe '#negative?' do
    it 'to be true' do
      expect(-1.negative?).to eq(true)
    end

    it 'to be false' do
      expect(1.negative?).to eq(false)
    end
  end

  describe '#ordinal' do
    it 'to be st' do
      expect(1.ordinal).to eq('st')
    end

    it 'to be nd' do
      expect(2.ordinal).to eq('nd')
    end

    it 'to be rd' do
      expect(3.ordinal).to eq('rd')
    end

    it 'to be th' do
      expect(11.ordinal).to eq('th')
    end
  end

  describe '#ordinalize' do
    it 'to be st' do
      expect(1.ordinalize).to eq('1st')
    end

    it 'to be nd' do
      expect(2.ordinalize).to eq('2nd')
    end

    it 'to be rd' do
      expect(3.ordinalize).to eq('3rd')
    end

    it 'to be th' do
      expect(11.ordinalize).to eq('11th')
    end
  end

  describe '#ounce_in_ounces' do
    it 'to be 3' do
      expect(3.ounce_in_ounces).to eq(3)
      expect(3.ounces_in_ounces).to eq(3)
    end
  end

  describe '#outside?' do
    it 'to be true' do
      expect(3.outside?(4, 5)).to eq(true)
    end

    it 'to be false' do
      expect(3.outside?(3, 5)).to eq(false)
    end
  end

  describe '#pad' do
    it 'to be 003' do
      expect(3.pad).to eq('003')
    end

    it 'to be 113' do
      expect(3.pad(pad_number: 1)).to eq('113')
    end

    it 'to be 0003' do
      expect(3.pad(precision: 4)).to eq('0003')
    end

    it 'to be 003.5' do
      expect(3.5.pad(precision: 5)).to eq('003.5')
    end
  end

  describe '#pad_precision' do
    it 'to be 3' do
      expect(3.pad_precision).to eq('3.00')
    end

    it 'to be 3.50' do
      expect(3.5.pad_precision).to eq('3.50')
    end

    it 'to be 3.11' do
      expect(3.pad_precision(pad_number: 1)).to eq('3.11')
    end

    it 'to be 3.000' do
      expect(3.pad_precision(precision: 3)).to eq('3.000')
    end

    it 'to be 3,00' do
      expect(3.pad_precision(separator: ',')).to eq('3,00')
    end
  end

  describe '#petabyte_in_bytes' do
    it 'to be 3377699720527872' do
      expect(3.petabyte_in_bytes).to eq(3377699720527872)
      expect(3.petabytes_in_bytes).to eq(3377699720527872)
    end
  end

  describe '#positive?' do
    it 'to be true' do
      expect(1.positive?).to eq(true)
    end

    it 'to be false' do
      expect(-1.positive?).to eq(false)
    end
  end

  describe '#pound_in_ounces' do
    it 'to be 48' do
      expect(3.pound_in_ounces).to eq(48)
      expect(3.pounds_in_ounces).to eq(48)
    end
  end

  describe '#power' do
    it 'to be 16' do
      expect(4.power(2)).to eq(16)
    end
  end

  describe '#root' do
    it 'to be 2' do
      expect(4.root(2)).to eq(2)
    end
  end

  describe '#second_in_seconds' do
    it 'to be 3' do
      expect(3.second_in_seconds).to eq(3)
      expect(3.seconds_in_seconds).to eq(3)
    end
  end

  describe '#stone_in_ounces' do
    it 'to be 672' do
      expect(3.stone_in_ounces).to eq(672)
      expect(3.stones_in_ounces).to eq(672)
    end
  end

  describe '#subtract' do
    it 'to be 2' do
      expect(4.subtract(2)).to eq(2)
    end
  end

  describe '#terabyte_in_bytes' do
    it 'to be 3298534883328' do
      expect(3.terabyte_in_bytes).to eq(3298534883328)
      expect(3.terabytes_in_bytes).to eq(3298534883328)
    end
  end

  describe '#to_byte' do
    it 'to be 1' do
      expect(1024.to_byte(:kilobyte, :megabyte)).to eq(1)
    end

    it 'to be 5' do
      expect(5120.to_byte(:kilobyte, :megabyte)).to eq(5)
    end

    it 'to be 1024' do
      expect(1024.to_byte(:kilobyte, :kilobyte)).to eq(1024)
      expect(1.to_byte(:megabyte, :kilobyte)).to eq(1024)
    end

    it 'to be 1048576' do
      expect(1.to_byte(:gigabyte, :kilobyte)).to eq(1048576)
    end

    it 'to be 0.078125' do
      expect(80.to_byte(:megabyte, :gigabyte)).to eq(0.078125)
    end

    it 'to raise error' do
      expect { 1.to_byte }.to raise_error(ArgumentError)
      expect { 1.to_byte(:bad, :kilobyte) }.to raise_error(ArgumentError)
      expect { 1.to_byte(:kilobyte, :bad) }.to raise_error(ArgumentError)
      expect { 1.to_byte(:bad, :bad) }.to raise_error(ArgumentError)
    end
  end

  describe '#to_currency' do
    it 'to be $3.00' do
      expect(3.to_currency).to eq('$3.00')
    end

    it 'to be $3.10' do
      expect(3.1.to_currency).to eq('$3.10')
    end

    it 'to be $3.11' do
      expect(3.11.to_currency).to eq('$3.11')
    end

    it 'to be @3.11' do
      expect(3.11.to_currency(unit: '@')).to eq('@3.11')
    end

    it 'to be $3.00000' do
      expect(3.to_currency(precision: 5)).to eq('$3.00000')
    end

    it 'to be $3.11' do
      expect(3.11111.to_currency).to eq('$3.11')
    end
  end

  describe '#to_length' do
    it 'to be 1' do
      expect(1.to_length(:millimeter, :millimeter)).to eq(1)
      expect(1.to_length(:inches, :inches)).to eq(1)
      expect(10.to_length(:millimeters, :centimeters)).to eq(1)
      expect(12.to_length(:inches, :feet)).to eq(1)
    end

    it 'to be 10' do
      expect(1.to_length(:centimeters, :millimeters)).to eq(10)
    end

    it 'to be 12' do
      expect(1.to_length(:feet, :inches)).to eq(12)
    end

    it 'to be 30.479999999999997' do
      expect(1.to_length(:feet, :centimeters)).to eq(30.479999999999997)
    end

    it 'to be 1093.6138888888888' do
      expect(1.to_length(:kilometer, :yard)).to eq(1093.6138888888888)
    end

    it 'to be 6076.118399999999' do
      expect(1.to_length(:nautical_miles, :feet)).to eq(6076.118399999999)
    end

    it 'to raise error' do
      expect { 1.to_length }.to raise_error(ArgumentError)
      expect { 1.to_length(:bad, :meters) }.to raise_error(ArgumentError)
      expect { 1.to_length(:meters, :bad) }.to raise_error(ArgumentError)
      expect { 1.to_length(:bad, :bad) }.to raise_error(ArgumentError)
    end
  end

  describe '#to_mass' do
    it 'to be 1' do
      expect(1.to_mass(:milligram, :milligram)).to eq(1)
      expect(1.to_mass(:ounces, :ounces)).to eq(1)
      expect(10.to_mass(:milligram, :centigram)).to eq(1)
      expect(16.to_mass(:ounces, :pounds)).to eq(1)
    end

    it 'to be 1.360776' do
      expect(3.to_mass(:pound, :kilogram)).to eq(1.360776)
    end

    it 'to be 1.1023125' do
      expect(1.to_mass(:metric_ton, :ton)).to eq(1.1023125)
    end

    it 'to be 2.204625' do
      expect(1.to_mass(:kilograms, :pounds)).to eq(2.204625)
    end

    it 'to be 10' do
      expect(1.to_mass(:centigrams, :milligrams)).to eq(10)
    end

    it 'to be 16' do
      expect(1.to_mass(:pounds, :ounces)).to eq(16)
    end

    it 'to be 64000' do
      expect(2.to_mass(:tons, :pounds)).to eq(4000)
    end

    it 'to raise error' do
      expect { 1.to_mass }.to raise_error(ArgumentError)
      expect { 1.to_mass(:bad, :pound) }.to raise_error(ArgumentError)
      expect { 1.to_mass(:pound, :bad) }.to raise_error(ArgumentError)
      expect { 1.to_mass(:bad, :bad) }.to raise_error(ArgumentError)
    end
  end

  describe '#to_nearest_value' do
    it 'to be 6' do
      expect(5.to_nearest_value([1, 3, 6, 9])).to eq(6)
    end

    it 'to be 3.6' do
      expect(3.5.to_nearest_value([3.0, 3.3, 3.6, 3.9])).to eq(3.6)
    end
  end

  describe '#to_percentage' do
    it 'to be 3.00%' do
      expect(3.to_percentage).to eq('3.00%')
    end

    it 'to be 3.10%' do
      expect(3.1.to_percentage).to eq('3.10%')
    end

    it 'to be 3.11%' do
      expect(3.11.to_percentage).to eq('3.11%')
    end

    it 'to be 3.11@' do
      expect(3.11.to_percentage(unit: '@')).to eq('3.11@')
    end

    it 'to be 3.00000%' do
      expect(3.to_percentage(precision: 5)).to eq('3.00000%')
    end

    it 'to be 3.11%' do
      expect(3.11111.to_percentage).to eq('3.11%')
    end
  end

  describe '#to_temperature' do
    it 'to be 212' do
      expect(100.to_temperature(:celsius, :fahrenheit)).to eq(212)
    end

    it 'to be 100' do
      expect(100.to_temperature(:celsius, :celsius)).to eq(100)
      expect(212.to_temperature(:fahrenheit, :celsius)).to eq(100)
    end

    it 'to be 373.15' do
      expect(100.to_temperature(:celsius, :kelvin)).to eq(373.15)
      expect(212.to_temperature(:fahrenheit, :kelvin)).to eq(373.15)
    end

    it 'to be -173.15' do
      expect(100.to_temperature(:kelvin, :celsius)).to eq(-173.14999999999998)
    end

    it 'to be -279.67' do
      expect(100.to_temperature(:kelvin, :fahrenheit)).to eq(-279.66999999999996)
    end

    it 'to raise error' do
      expect { 1.to_temperature }.to raise_error(ArgumentError)
      expect { 1.to_temperature(:bad, :kelvin) }.to raise_error(ArgumentError)
      expect { 1.to_temperature(:kelvin, :bad) }.to raise_error(ArgumentError)
      expect { 1.to_temperature(:bad, :bad) }.to raise_error(ArgumentError)
    end
  end

  describe '#to_time' do
    it 'to be 2' do
      expect(120.to_time(:seconds, :minutes)).to eq(2)
    end

    it 'to be 40' do
      expect(2400.to_time(:minutes, :hours)).to eq(40)
    end

    it 'to be 3' do
      expect(72.to_time(:hours, :days)).to eq(3)
    end

    it 'to be 5' do
      expect(1825.to_time(:days, :years)).to eq(4.996577686516085)
    end

    it 'to be 172800' do
      expect(2.to_time(:days, :seconds)).to eq(172800)
    end

    it 'to raise error' do
      expect { 1.to_time }.to raise_error(ArgumentError)
      expect { 1.to_time(:bad, :days) }.to raise_error(ArgumentError)
      expect { 1.to_time(:days, :bad) }.to raise_error(ArgumentError)
      expect { 1.to_time(:bad, :bad) }.to raise_error(ArgumentError)
    end
  end

  describe '#ton_in_ounces' do
    it 'to be 96000' do
      expect(3.ton_in_ounces).to eq(96000)
      expect(3.tons_in_ounces).to eq(96000)
    end
  end

  describe '#within?' do
    it 'to be true' do
      expect(10.006.within?(10, 0.1)).to eq(true)
      expect(100.4.within?(100.6, 1)).to eq(true)
    end
  end

  describe '#week_in_seconds' do
    it 'to be 1814400' do
      expect(3.week_in_seconds).to eq(1814400)
      expect(3.weeks_in_seconds).to eq(1814400)
    end
  end

  describe '#yard_in_inches' do
    it 'to be 36' do
      expect(3.yard_in_inches).to eq(108)
      expect(3.yards_in_inches).to eq(108)
    end
  end

  describe '#year_in_seconds' do
    it 'to be 94672800.0' do
      expect(3.year_in_seconds).to eq(94672800.0)
      expect(3.years_in_seconds).to eq(94672800.0)
    end
  end

end
