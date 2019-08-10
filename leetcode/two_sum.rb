# two sum
# leetcode easy
# Sat 8.10
# 2

require 'pry'
# input
#   array of integers
# output
#   array
#   indicies of the two numbers such they add up to a specific target
# rules
#   each input should have exactly one solution
#   do not use the same element twice

# given an array of nums
# iterate over the array with an outer loop and an inner loop
# outer loop should loop until the outer num is 1 less than the size of the arr of nums
#   inner loop should loop until inner num is the size of the arr
#   ensure both nums are not the same, if they are next
#   if the nums summed equal the tgt, return the inner and outer nums in an array

# my solution (faster than 27% of other solution)
# def two_sum(nums, target)
#   outer = 0
#   while outer < (nums.size - 1)
#     inner = outer + 1
#     while inner < nums.size
#       return [outer, inner] if nums[outer] + nums[inner] == target
#       inner += 1
#     end
#     outer += 1
#   end
# end

# a suggested solution from leetcode
# use a hash which increases the speed by trading speed for space
# first iteration we add each value and its index to the table
# check if each element's complement (target - nums[i]) exists in the table

# create a hash, with each key as the numbers in the nums arr and each value as their index
# iterate over table
#   check to see if the element's complement exists

# def two_sum(nums, target)
#   # create the hash, assign each index as the key and num as the value
#   nums_and_indexes = {}
#   nums.each_with_index do |num, index|
#       nums_and_indexes[index] = num
#   end
#
#   # check if num's complement exists in table, that isn't the same element
#   nums.each_with_index do |num, index|
#     complement = target - num
#     if (nums_and_indexes.value?(complement) && nums_and_indexes.key(complement) != index)
#       return [index, nums_and_indexes.key(complement)]
#     end
#   end
#
# end

# third solutioin, single-pass hash table
# while generating the hash table we can look back to check if the
# element's complement already exists in the table
# if it does, we can return immediately
def two_sum(nums, target)
  nums_table = {}
  nums.each_with_index do |num, idx|
    # check hash if complement exists
    # if it doesn't, simply add to table
    # if it does, return the solution
    complement = target - num
    if nums_table.value?(complement)
      return [idx, nums_table.key(complement)]
    else
      nums_table[idx] = num
    end
  end
end

# examples
p two_sum([2, 7, 11, 15], 9) # => [0, 1] because 2 + 7 = target of 9
p two_sum([3, 3], 6)
p two_sum([3, 2, 4], 6)
