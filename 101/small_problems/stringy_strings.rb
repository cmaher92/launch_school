# Stringy strings

# Write a method that takes one argument, a positive integer, and returns a 
# string of alternating 1s and 0s, always starting with 1. 
# The length of the string should match the given integer.

# understanding the problem
# input
#     positive integer
# output
#     string of alternating 1s and 0s
#     always starts with 1
# rule
#     length of string should match the given integer

# algorithm
# create stringy
# one_or_not
# take the int and times it
#     if one_or_not is true
#         push a 1
#         one_or_not = false
#     else
#         push a 0
#         one_or_not = true
#     end

# solution

def stringy(num)
    stringy = ''
    one_or_not = true
    num.times do
        if one_or_not == true
            stringy << '1'
            one_or_not = false
        else
            stringy << '0'
            one_or_not = true
        end
    end
    stringy
end
# test cases

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'