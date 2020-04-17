# sum_of_sums.rb

# input: array of integers
# output: integer

# [1, 2, 3]
# [1] + [1 + 2] + [1, 2, 3]

# algorithm:
# separate array into subarrays of sequences
#   - iterate over the array, transforming each element to the sequence from 0 to the current index
#   - sum the sequence and return
# sum the array of sequences and return

def sum_of_sums(nums)
  nums.map.with_index { |_, idx| nums[0..idx].reduce(:+) }.reduce(:+)
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
