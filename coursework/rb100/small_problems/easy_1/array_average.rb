# Array Average

# Write a method that takes one argument, an array containing integers, 
# and returns the average of all numbers in the array. 
# The array will never be empty and the numbers will always be positive 
# integers.

# Given an array containing integers

# find the length of the array
# sum all of the integers in the array
# divide the sum by the length of the array

# START
# 
# SET sum = all items in array added together
# PRINT sum / array.length
# 
# END

def average(ints)
  sum = ints.inject(:+)
  sum / ints.length
end

# Test cases
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
# The tests above should print true.
