# Roman numerals

# Write a method that when passed an integer between 1 and 3,000
# returns a string containing the proper old-school roman numeral
# roman_numeral 4 => IIII
# I = 1
# V = 5
# X = 10
# L = 50
# C = 100
# D = 500
# M = 1000

def roman_numeral number
  roman_array = []
  current_number = number
    if current_number > 1000
      number_of_m = current_number / 1000
      current_number = current_number % 1000
      roman_array << "M"*number_of_m
    end
    if current_number > 500
      number_of_d = current_number / 500
      current_number = current_number % 500
      roman_array << "D"*number_of_d
    end
    if current_number > 100
      number_of_c = current_number / 100
      current_number = current_number % 100
      roman_array << "C"*number_of_c
    end
    if current_number > 50
      number_of_l = current_number / 50
      current_number = current_number % 50
      roman_array << "L"*number_of_l
    end
    if current_number > 10
      number_of_x = current_number / 10
      current_number = current_number % 10
      roman_array << "X"*number_of_x
    end
    if current_number > 5
      number_of_v = current_number / 5
      current_number = current_number % 5
      roman_array << "V"*number_of_v
    end
    if current_number > 1
      number_of_i = current_number / 1
      current_number = current_number % 1
      roman_array << "I"*number_of_i
    end
    print roman_array.join('') + "\n"

end

roman_numeral 999
