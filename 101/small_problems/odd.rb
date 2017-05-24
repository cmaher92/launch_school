# odd
#Write a method that takes one integer argument, which may be positive, negative,
#or zero. This method return true if the number's absolute value is odd. 
#You may assume that the argument is a valid integer value.

# understanding the problem
# input
#   integer: may be positive, negative, or zero
# output
#   boolean:
#       true: if number's absolute value is odd
#       false: everything else
# rule
#   cannot use odd? or even? in solution
# algorithm
    # check to see if num modulo 2 is equal to 1
    
# solution
    # def is_odd?(num)
    #     num % 2 == 1 || num
    # end
    
# diving deeper
    def is_odd?(num)
        num.remainder(2) == 1 || num.remainder(2) == -1
    end

# test cases
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false