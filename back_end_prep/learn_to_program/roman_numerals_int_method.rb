require 'pry'

class Integer
  def to_roman
    if self < 0
      return 'Please enter a number that isn\'t negative.'
    end
    if self == 0
      return 'nulla'
    end

    roman_string = ''

    left = self
    write = left/1000
    left = left - write*1000
    if write > 0
      roman_string = 'M'*write
    end

    write = left/900
    left = left - write*900
    if write > 0
      roman_string = roman_string + "CM"
    end

    # binding.pry

    write = left/500
    left = left - write*500
    if write > 0
      roman_string = roman_string + "D"
    end

    write = left/400
    left = left - write*400
    if write > 0
      roman_string = roman_string + "CD"
    end

    write = left/100
    left = left - write*100
    if write > 0
      roman_string = roman_string + "C"*write
    end

    write = left/90
    left = left - write*90
    if write > 0
      roman_string = roman_string + "XC"
    end

    write = left/50
    left = left - write*50
    if write > 0
      roman_string = roman_string + "L"
    end

    write = left/40
    left = left - write*40
    if write > 0
      roman_string = roman_string + "XL"
    end

    write = left/10
    left = left - write*10
    if write > 0
      roman_string = roman_string + "X"*write
    end

    write = left/9
    left = left - write*9
    if write > 0
      roman_string = roman_string + "IX"
    end

    write = left/5
    left = left - write*5
    if write > 0
      roman_string = roman_string + "V"
    end

    write = left/1
    left = left - write*1
    if write > 0
      roman_string = roman_string + "I"*write
    end
    return roman_string
  end
end

puts 4412.to_roman
# => CMXCIX
# => DCCCCLXXXXVIIII
