# Sum of (Two) Squares
# We are asking for a function to take a non-negative integer value, 
# and return a list of all non-negative integer pairs whose values 
# - when squared - sum to the given integer.

# For example, given the parameter 25, 
# the function should return the two 
# pairs 5,0 and 3,4 because 5^2 + 0^2 = 25 and 3^2 + 4^2 = 25.

# We might express that in pseudo-code like this:
# all_squared_pairs(25) == [[5,0],[3,4]];
# Here are the requirements:
# The return value should be an array of pairs ( nested arrays ) of non-negative integers in any order.
# A parameter value that is not the sum of any two squares should simply return an empty array.
# We will consider 5,0 and 0,5 to be equal pairs, disregarding the order. Do not list the same pair twice.
# The upper bound of the parameter value will be 2,147,483,647.

# input:
#   - integer; the target sum value for the sum of two squared pairs
# output:
#   - nested array; subarr of pairs of integers that when squared and summed are equivalent to input
# constraints:
#   - upper bound of the parameter value will be 2,147,483,647
#   - the parameter value that is not the sum of any two squares should simply return an empty array
#   - order of return value doesn't matter
# mental model:
#   - create a hash of numbers when squared are less than or equal to the value of the target
#   - incrementally check list of numbers to find pairs that equal the target number
#     - subtract the current number squared from target number
#     - take result and multiply by the power of 0.5
#     - see if the list includes the number
#     - if it does, add the pair to the results array if it doesn't exist
#       - make sure to place the smaller number first in the pairs array, that way we can check if it's present
# algorithm/data structure:
#   - create a hash where the keys are numbers and their values are the numbers squared
#     - until current_num squared is > parameter increment num
#     - find difference between current number squared and target number
#     - check to see if difference is in hash
#       - if it is, add the value + current_num to result array
#       - if it isn't, add current_num to hash
#     - incremement current_num
require 'pry'

def all_squared_pairs(tgt)
  squared_pairs = []
  squares = {}
  current_num = 0
  until current_num**2 > tgt
    difference = tgt - current_num**2
    squares[current_num**2] = current_num
    squared_pairs << [current_num, squares[difference]] if squares[difference] != nil
    current_num += 1
  end
  squared_pairs.map do |pair| 
    pair.sort!
    [pair[0], pair[1].to_f]
  end.sort
end

p all_squared_pairs(0)
p all_squared_pairs(25) #== [[5,0],[3,4]]
