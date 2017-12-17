# Running totals

# Write a method that takes an Array of numbers, and returns an Array
# with the same number of elements, and each element has the running total
# from the original Array

# input
#   array of nums
# output
#   array of nums, each number is summed
  
# given an array of nums
#   take the original array and create a new array with each element contain the running total of the previous element
# return the new array

# given the array of nums
# init a local variable and assign to 0
# init a local variable representing new array
#   for each num in array
#     add num to running_total
#     append running total to new array
# return new_arr

def running_total(arr)
  running_total = 0
  new_arr = []
  arr.each do |num|
    running_total += num
    new_arr << running_total
  end
  new_arr
end

# Test cases
puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []

# Solution
# def running_total(array)
#   sum = 0
#   array.map { |value| sum += value }
# end
# Discussion

# This solution does nothing fancy; it just walks through the array calculating
# the running total while building the resulting array. #map makes this 
# really easy.

# Further Exploration

# Try solving this problem using Array#each_with_object or Enumerable#inject
# (note that Enumerable methods can be applied to Arrays).