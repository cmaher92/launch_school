# roman to int takes roman nums and turms them into ints

def roman_to_int number
end

def is_roman? roman_string
  is_numeral = true
  while is_numeral == true
    roman_string.each do |numeral|
     if numeral == 'i'
       return
      elsif numeral == 'v'
        return
      elsif numeral == 'x'
        return
      elsif numeral == 'l'
        return
      elsif numeral == 'c'
        return
      elsif numeral == 'd'
        return
      elsif numeral == 'm'
        return
      else
        is_numeral = false
        puts "please enter a valid roman numeral."
      end
    end
   end

puts is_roman? 'ivxlcdmn'
