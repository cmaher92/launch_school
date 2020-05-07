# The objective is to return all pairs of integers 
# from a given collection of integers that have a difference of 2.
# The result should be sorted in ascending order.
# The input will consist of unique values. 
# The order of the integers in the input collection should not matter.

# input: Array of integers
# output: Array of subarrays; containing pairs of integers that have a difference of 2
# algorithm:
#   key is the value

# psuedocode:
#   outer loop, finds the first operand in the difference
#     - regular iterator will work here, also prevent from running if arr is empty
#     inner loop, finds the second operand
#       - break when counter is 1 less than size of array
#       - starts at outer loops counter + 1
#       - find difference, if 2 add to results array
#       - increments by 1
#     - increment outer loop counter by 1
require 'pry'

def twos_difference(arr)
  result = []

  arr.each do |number|
    if arr.include?(number + 2)
      result << [number, number + 2]
    end
  end

  result.sort
end

# Examples
#[1, 2, 3, 4]      -->  [[1, 3], [2, 4]]
#[4, 1, 2, 3]      -->  [[1, 3], [2, 4]]
#[1, 23, 3, 4, 7]  -->  [[1, 3]]
#[4, 3, 1, 5, 6]   -->  [[1, 3], [3, 5], [4, 6]]

# test cases
p twos_difference([1, 2, 3, 4])    == [[1, 3], [2, 4]]
p twos_difference([1, 3, 4, 6])    == [[1, 3], [4, 6]]
p twos_difference([0, 3, 1, 4])    == [[1, 3]]
p twos_difference([4, 1, 2, 3])    == [[1, 3], [2, 4]]
p twos_difference([6, 3, 4, 1, 5]) == [[1, 3], [3, 5], [4, 6]]
p twos_difference([3, 1, 6, 4])    == [[1, 3], [4, 6]]
p twos_difference([1, 3, 5, 6, 8, 10, 15, 32, 12, 14, 56]) == [[1, 3], [3, 5], [6, 8], [8, 10], [10, 12], [12, 14]]
p twos_difference([1, 4, 7, 10]) == []
p twos_difference([]) == []
