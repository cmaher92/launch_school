# Convert a Signed Number to a String!
#
# In the previous exercise, you developed a method that converts non-negative
# numbers to strings. In this exercise, you're going to extend that method by
# adding the ability to represent negative numbers as well.
#
# Write a method that takes an integer, and converts it to a string representation.
#
# You may not use any of the standard conversion methods available in Ruby,
# such as Integer#to_s, String(), Kernel#format, etc. You may, however, use
# integer_to_string from the previous exercise.

# input
#   integer, could be either positive or negative
# output
#   string, include the sign of the num
#
# given an int
# first, note the sign by checking to see if the num is less than 0
# change the num to positive if in fact it is negative
# call the method from the previous exercise
# prepend the proper sign

require_relative 'num_to_str'

def signed_integer_to_string(number)
  result = ''
  negative = false
  if number < 0
    negative = true
    number = number.abs
  end
  result = integer_to_string(number)
  if negative && number != 0
    result.prepend('-')
  elsif number != 0
    result.prepend('+')
  end
  result
end

#
# Test cases
puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
