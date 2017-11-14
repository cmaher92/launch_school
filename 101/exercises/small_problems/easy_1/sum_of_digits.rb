# Sum of Digits

# Write a method that takes one argument, 
# a positive integer, and returns the sum of its digits.

# given a positive integer
# - turn the integer into a string
# - split the string into an array
# - sum the array 
# - return 

# START

# int.to_s.split(//).inject(:+)

# END

# def sum(int)
#     arr = int.to_s.split(//)
#     new_arr = Array.new
#     arr.each { |str| new_arr << str.to_i }
#     new_arr.inject(:+)
#     end
    
# Given an int
# split into array
# array to string 
# string to int
# sum array

def sum(int)
    foo = int.to_s.split(//)
    p foo.to_s
end

# Examples:
puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45
# The tests above should print true.

# For a challenge, try writing this without any basic looping constructs 
# (while, until, loop, and each).