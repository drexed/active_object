class Integer

  ROMAN_VALUES = {
    'M'  => 1000,
    'CM' => 900,
    'D'  => 500,
    'CD' => 400,
    'C'  => 100,
    'XC' => 90,
    'L'  => 50,
    'XL' => 40,
    'X'  => 10,
    'IX' => 9,
    'V'  => 5,
    'IV' => 4,
    'I'  => 1
  }.freeze

  def factorial
    return(1) if zero?
    2.upto(self).inject(1) { |p, n| p * n }
  end

  def of(&block)
    Array.new(self, &block)
  end

  def roman
    return(''.freeze) if zero?
    return("-#{(-self).roman}") if self < 0

    ROMAN_VALUES.each { |k, v| return("#{k}#{(self - v).roman}") if v <= self }
  end

  def time
    Time.at(self)
  end

end