# Stringy Strings

# Write a method that takes one argument, a positive integer, 
# and returns a string of alternating 1s and 0s, always starting with 1. 
# The length of the string should match the given integer.

# Given a positive integer
# Create an empty string
# Create a boolean odd
# iterate until reaching the integer
#     - if odd is true
#         - append a 0 to the string
#         - set odd to false
#     - else
#         append a 1
#         set odd to true
        
# return string

# START

# Given a positive integer
# SET stringy = ""
# SET odd = false
# for each number up until the integer 
# - IF odd == true
#     stringy << "0"
#     odd = false
# - ELSE
#     stringy << "1"
#     odd = true
# PRINT stringy

# END

def stringy(int)
    stringy = ""
    odd = false
    int.times do
        if odd == true
            stringy << "0"
            odd = false
        else 
            stringy << "1"
            odd = true
        end
    end
    return stringy
end

# Examples:
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
# The tests above should print true.
