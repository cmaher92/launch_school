# playing around with Array#inject

require 'pry'

# (5..10).inject do |sum, num|
#     binding.pry
#     sum + num
# end

# sum starts as 5
# num starts as 6, the second element in the array

[1, 2, 3].inject do |a, i|
    binding.pry 
    a*10 + i 
    end
    
    # a is 1
    # i is 2
    
    # a is 12
    # i is 3
    
    # a is 123
    