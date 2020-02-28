# Odd

# Write a method that takes one integer argument, which may be positive,
# negative, or zero. This method return true if the number's absolute
# value is odd. You may assume that the argument is a valid integer value.

# input
  # integer; positive, negative, or zero
# output
  # boolean; true if absolute value is odd

# given a number
# if the number % returns 1 it's true, else return false

def is_odd?(num)
  num%2 == 0 ? false : true
end

# Test cases
puts is_odd?(2)  == false
puts is_odd?(5)  == true
puts is_odd?(-17)== true
puts is_odd?(-8) == false
puts is_odd?(0)  == false
puts is_odd?(7)  == true
