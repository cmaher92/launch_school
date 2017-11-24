# Convert a Number to a String!
#
# In the previous two exercises, you developed methods that convert simple
# numeric strings to signed Integers. In this exercise and the next, you're
# going to reverse those methods.
#
# Write a method that takes a positive integer or zero,
# and converts it to a string representation.
#
# You may not use any of the standard conversion methods available in Ruby,
# such as Integer#to_s, String(), Kernel#format, etc.
# Your method should do this the old-fashioned way and construct the string
# by analyzing and manipulating the number.

# input
#   integer - positive or 0
# output
#   string representation of the inputted int
# rules
#   no stand conversion methods
#
# given an integer that is 0 or positive
# break the integer up into an array
#   divide by x
#     x is determined by the size of the number
#     if the number is between 10 and 99 / 10
#     if the number is between 100 and 999 / 100
#     if the number is between 1000 and 9999 / 1000
#     if the number is between 10000 and 99999 / 10000
#   if less than 10 modulo by 10
# map each integer to it's string representation
# combine the array into a string
# return the string

NUMBERS = {1=> '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5',
        6=> '6', 7 => '7', 8 => '8', 9 => '9', 0 => '0'}

def integer_to_string(number)
  result = ''
  loop do
    number, rem = number.divmod(10)
    result.prepend(NUMBERS[rem])
    break if number == 0
  end
  result
end

# the program is breaking after seeing only a single 0
# change the current program to handle multiple 0's



# puts integer_to_string(97)
# puts integer_to_string(997)

# Examples
# puts integer_to_string(4321) == '4321'
# puts integer_to_string(0) == '0'
# puts integer_to_string(5000) == '5000'
