# Lettercase Percentage Ratio
# Medium 2, problem 3

# Write a method that takes a string, and then returns a hash that contains 3 entries: 
# one represents the percentage of characters in the string that are lowercase letters, 
# one the percentage of characters that are uppercase letters, 
# and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

# < string
# > hash; lowercase: 0, uppercase: 0, neither: 0
# ! always contain at least one character
# &
# create hash, default value 0
# iterate over each character in the string
#   - if it's lowercase, add 1 to hash
#     - char.match?(/[a-z]/)
#   - if it's uppercase, add 1
#   - if it's neither, add 1
# map values of hash to percentages of length of string
#   - divide count of value by length of string -> decimal
#   - convert decimal to percentage (100 * decimal)
require 'pry'

def letter_percentages(str)
  letter_percentages = { uppercase: 0, lowercase: 0, neither: 0 }
  str.each_char do |char|
    case
    when char.match?(/[a-z]/) then letter_percentages[:lowercase] += 1
    when char.match?(/[A-Z]/) then letter_percentages[:uppercase] += 1
    else
      letter_percentages[:neither] += 1
    end
  end

  letter_percentages = letter_percentages.map do |key, number| 
    number = 100 * (number / str.length.to_f)
    [key, number]
  end

  letter_percentages.map do |(k, v)|
    v = (v % 1 == 0.0 ? v.to_i : v.round(2))
    [k, v]  
  end.to_h
end

# Examples
p letter_percentages('abCdef 123') #== { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') #== { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') #== { lowercase: 0, uppercase: 0, neither: 100 }
p letter_percentages('abcdefGHI')