# ASCII String Value
#
# Write a method that determines and returns the ASCII string value of a string
# that is passed in as an argument. The ASCII string value is the sum of the
# ASCII values of every character in the string. (You may use String#ord
# to determine the ASCII value of a character.)

# given a sring
# turn the string into an array
# map each character in the array of characters to it's ascii string value
# reduce the array into it's sum
# return the result
require 'pry'

def ascii_value(str)
  # & is used here as a shorthand way of calling a block
  str.split('').map(&:ord).sum
  binding.pry
end

# Test cases
# puts ascii_value('Four score') == 984
# puts ascii_value('Launch School') == 1251
# puts ascii_value('a') == 97
puts ascii_value('') == 0
