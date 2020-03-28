# Array Average

# Write a method that takes one argument, 
# an array containing integers, 
# and returns the average of all numbers in the array. 
# The array will never be empty and the numbers will always be positive integers.

# - input
#   - array: containing integers
# - output
#   - integer: average of all numbers in the array
# - rules
#   - array will never be empty
#   - numbers will always be positive

# - data structure
#  - array: ability to reduce the items in the array into the sum
# - algorithm
#  - divide the sum of the array by the size of the array
#   - count the items
#   - divide by the result of reducing the array down to the sum

def average(arr)
  arr.reduce(:+) / arr.size.to_f
end 

#- tests
puts average([1, 5, 87, 45, 8, 8])    #== 25
puts average([9, 47, 23, 95, 16, 52]) #== 40.0