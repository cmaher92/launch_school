=begin
The maximum sum subarray problem consists in finding the maximum 
sum of a contiguous subsequence in an array or list of integers:

maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
-- should be 6: [4, -1, 2, 1]
Easy case is when the list is made up of only positive numbers and the maximum 
sum is the sum of the whole array. If the list is made up of only negative numbers, return 0 instead.

Empty list is considered to have zero greatest sum. Note that the empty list or array is also a valid sublist/subarray.
=end

# input:
#   - Array of integers
# output:
#   - Integer
# constraints:
#   - maximum sum– sum of a contiguous subsequence in a list of integers
#   - if array is only negative numbers, return 0
#   - if array is empty, return 0
# test input/output
# input
# [-2, 1, -3, 4, -1, 2, 1, -5, 4]
# [-2, 1]
# [-2, 1, -3]
# ...
# algorithm/data structure:
#   - find all combinations of consecutive integers
#   - set local variable current_max to 0
#   - iterate over the list of integers which will be beginning of sequence
#     - set local variable end_seq to begin_seq + 1
#     - iterate until end_seq is equal to length of the list of integers
#     - check to see if current combination is greater than current max
#     - increment end sequence
#   - return maximum sum

# def max_sequence(arr)
#   current_max = 0
#   arr.each_index do |begin_seq|
#     end_seq = begin_seq
#     while end_seq < arr.size
#       current_max = arr[begin_seq..end_seq].sum if arr[begin_seq..end_seq].sum > current_max
#       end_seq += 1
#     end
#   end
#   current_max
# end

def max_sequence(arr)
  sum = 0
  max = 0

  arr.each do |num|
    sum += num

    sum = 0 if sum < 0
    max = sum if sum > max
  end

  max
end

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
