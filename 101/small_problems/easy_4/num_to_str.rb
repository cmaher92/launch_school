# convert a number to a string

# In the previous two exercises, you developed methods that convert simple 
# numeric strings to signed Integers. In this exercise and the next, 
# you're going to reverse those methods.

# Write a method that takes a positive integer or zero, 
# and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, 
# such as Integer#to_s, String(), Kernel#format, etc. 
# Your method should do this the old-fashioned way and construct the string 
# by analyzing and manipulating the number.

# understanding
# input
#   positive integer or zero
# output
#   string representation of the integer
# rules
#   no standard conversion methods

# algorithm
# split the integer into an array
# map the integers to their string representations
# join the array and return

# def integer_to_string(integer)
#     int_to_str = { 
#         1 => '1',
#         2 => '2',
#         3 => '3',
#         4 => '4',
#         5 => '5',
#         6 => '6',
#         7 => '7',
#         8 => '8',
#         9 => '9',
#         0 => '0'
#     }
#     integer = integer.digits
#     integer.map! { |digit| int_to_str[digit] }
#     integer.join.reverse
# end

# result provided
DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
    result = ''
    
    loop do
        number, remainder = number.divmod(10)
        result.prepend(DIGITS[remainder])
        
        break if number == 0
    end
    result
end

# test cases
puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'
puts integer_to_string(5009) == '5009'