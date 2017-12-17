# Squaring an Argument
#
# Using the multiply method from the "Multiplying Two Numbers" problem, write
# a method that computes the square of its argument (the square is the result of
# multiplying a number by itself).

require_relative 'multiplying_two_nums'

#  method that takes one argument
#  calls multiply method
#  returns int

def square(num)
  multiply(num, num)
end
#
# Example:
puts square(5) == 25
puts square(-8) == 64
