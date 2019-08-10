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


def two_sum(nums, target)
  outer = 0
  while outer < (nums.size - 1)
    inner = outer + 1
    while inner < nums.size
      # binding.pry
      return [outer, inner] if nums[outer] + nums[inner] == target
      inner += 1
    end
    outer += 1
  end
end

# examples
p two_sum([2, 7, 11, 15], 9) # => [0, 1] because 2 + 7 = target of 9
p two_sum([3, 3], 6)
