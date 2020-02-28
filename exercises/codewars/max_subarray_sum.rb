# Maxiumum subarray sum
# 5 kyu
# Sat 8.10
# 1

require 'pry'

# input
#   array of integers
# output
#   integer - sum of a contiguous subsequence
# rules
#   output 0 if all negative numbers
#   empty list is 0 as well

# check every possible combination for the largest sum
# create an array of arrays that will contain all combinations
#

# my solution with help with double while loop
# def max_sequence(arr)
#   return 0 if arr.empty?
#   sum = 0
#   i = 0
#
#   while i < arr.size - 1
#     j = i + 1
#     while j < arr.size
#       result = arr[i..j].inject(:+)
#       if result > sum
#         sum = result
#       end
#       j += 1
#     end
#     i += 1
#   end
#
#   (sum > arr.max) ? sum : arr.max
# end

def max_sequence(arr)
  return 0 if arr.empty?

  max_ending_here = max_so_far = 0

  arr.each do |n|
    max_ending_here = [n, max_ending_here + n].max
    max_so_far = [max_so_far, max_ending_here].max
  end

  max_so_far
end

p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4])
p max_sequence([-32])
p max_sequence([11])
