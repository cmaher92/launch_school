# In the easy exercises, we worked on a problem where we had to count the
# number of uppercase and lowercase characters, as well as characters that
# were neither of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that
# contains 3 entries:
# one represents the percentage of characters in the string that are lowercase
# one the percentage of characters that are uppercase letters
# one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

# input
#   string
# output
#   hash, containing :lowercase, :uppercase, and :neither as keys
#         containging ints as values, representing the percentages
require 'pry'
# def letter_percentages(str)
#   total = str.size
#   percentages = {lowercase: 0, uppercase: 0, neither: 0}
#   lowercase_percent = (str.count('a-z').to_f / total) * 100
#   uppercase_percent = (str.count('A-Z').to_f / total) * 100
#   neither_percent   = 100 - (lowercase_percent + uppercase_percent)
#   percentages[:lowercase] = lowercase_percent
#   percentages[:uppercase] = uppercase_percent
#   percentages[:neither]   = neither_percent
#   percentages
# end

def letter_percentages(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  percentages = { lowercase: [], uppercase: [], neither: [] }
  characters = string.chars
  length = string.length

  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }

  calculate(percentages, counts, length)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
  percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
  percentages[:neither] = (counts[:neither] / length.to_f) * 100
end

# Test Cases
p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
