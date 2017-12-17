# Odd

# Write a method that takes one integer argument, which may be positive,
# negative, or zero. This method return true if the number's absolute
# value is odd. You may assume that the argument is a valid integer value.

# Given an integer
#
# if the remainder of the number divided by 2 is 1
#   return true
# else
#   return false

# START
#
# IF number % 2 = 1
#   PRINT true
# ELSE
#   PRINT false
#
# END

# def is_odd?(number)
#
#   if number % 2 == 1
#     return true
#   else
#     return false
#   end
#
# end

# def is_odd?(number)
#   number % 2 == 1
# end

# If you weren't certain whether % were the modulus or remainder operator,
# how would you rewrite #is_odd? so it worked regardless?

# def is_odd?(number)
#   number % 2 == 1 || number % 2 == -1
# end

# The Integer#remainder method performs a remainder operation in Ruby.
# Rewrite #is_odd? to use Integer#remainder instead of %. Note: before version
# 2.4, Ruby used the Numeric#remainder method instead.

def is_odd?(number)
  number.remainder(2) == 1 || number.remainder(2) == -1
end

# Test cases
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
