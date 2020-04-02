# ASCII String Value
# easy_5

# < string
# > integer
#   - total ascii value of the string
# ! sum of the ascii values
# ! possible empty string
# ! use String#ord to figure out ascii value
# ~ create a range from 0 to the length of the str - 1
# ~ create a total variable set to 0
# ~ for each number in the range
# ~ iterate
#   ~ determine the ordinal value of the character
#   ~ add it to total
# ~ return return total
require 'pry'

def ascii_value(str)
  # total = 0
  # (0...str.length).each { |i| total += str[i].ord }
  # total
  str.chars.inject(0) { |sum, c| sum + c.ord }
end


p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0