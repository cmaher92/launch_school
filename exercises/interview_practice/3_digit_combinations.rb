#Given an array of numbers, return an array of arrays that contain all of the potential 3 digit combinations that have a sum of `0`.

# Input: Array of numbers
# Output: Array of Arrays, each subarray containing an integer
# Rules: 
#   - input can be negative numbers
#   - output subarrys are length of 3
#   - output subarrays summed == 0
# Alg:
# I need to find all combinations of 3
#   - pass the array into combination method
#   - select all combinations that when reduced == 0
#   - uniq
# I need to return that results array

def triplet_sum_zero(arr)
  arr.combination(3).select { |subarr| subarr.reduce(:+) == 0 }
end

# how to find non-sequential series of elementse within an array
#   - 