# array average

# Write a method that takes one argument, an array containing integers, 
# and returns the average of all numbers in the array. The array will never 
# be empty and the numbers will always be positive integers.

# understanding the problem
# input
#     array containing integers
# output
#     integer with average of all numbers
# rules
#     array will never be empty
#     numbers will always be positive integers

# algorithm
# find the count of the array
# sum all of the items in the array and divide by the count

# solution
def average(arr)
   (arr.reduce(:+) / arr.count).to_f
end
# test cases
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
puts average([9, 47, 23, 95, 16, 52])
# The tests above should print true.