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

# def signed_integer_to_string(number)
#   # Compare the number using the spaceship operator
#   # when the result is -1 use string interpolation to prepend the - sign
#   # when the result is +1 use string interpolation to prepend the + sing
#   # else just interpolate the result from calling the integer_to_str method
#   case number <=> 0
#   when -1 then "-#{integer_to_string(-number)}"
#   when +1 then "+#{integer_to_string(number)}"
#   else
#     integer_to_string(number)
#   end
# end

# Refactor our solution to reduce the 3 integer_to_string calls to just one.

# comparing to see if it's -1, 0, or +1
# calling the integer_to_string method depending on the comparison
# returning the result

# Now I need to simply call the intger_to_string method once
# compare and set a local variable to -1, 0, or +1
# get the absolute value of the number
# then do a case statement interpolating the result based on the local variable

def signed_integer_to_string(number)
  sign = number <=> 0
  number = number.abs
  result = integer_to_string(number)
  case sign
  when -1 then "-#{result}"
  when +1 then "+#{result}"
  else result
  end
end


#
# Test cases
puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
