# List of Digits

# Write a method that takes one argument, a positive integer, and returns 
# a list of the digits in the number.

# given an integer
# make the integer a string
# split the string into an array
# given an collection of strings
# create a new array
# for each string in the collection of strings
#   - convert the string to an integer
#   - add the integer to the newly created array
# return the newly created array

# START
# SET string_ints = int.to_s
# SET array_string_ints = string_ints.split(//)
# SET ints = Array.new
# FOR each string in array_string_ints
#   ints << string.to_i
# 
# PRINT ints
# END
def digit_list(int)
    string_ints = int.to_s
    array_string_ints = string_ints.split(//)
    ints = Array.new
    array_string_ints.each do |string|
        ints << string.to_i
    end
    return ints
end

# Test cases
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
