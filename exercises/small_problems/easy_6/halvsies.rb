# halvsies

# input: array
# output: two arrays, as a pair of nested arrays
# rules:
#   contain the first half and second half of the array respectively
#   if the array contains an odd number of elements, middle element should be in first array
#   empty array should return an empty pair of arrays in an array
# algorithm:
# find the index that marks half of the array
#   if the length is odd, divide length of array by 2 and add 1
#   if the length is even, divide length of array by 2
# seperate the arrays into halves
#   use element reference to retrieve each half
#     - first_half = ary[0, half - 1]
#     - second_half = ary[half, -1] unless ary[half, -1] == nil
# return both halves
# [first_half, second_half]

def halvsies(ary)
  first_half, second_half = [], []
  return first_half, second_half if ary.empty? # handle empty array
  half = ary.length.odd? ? (ary.length / 2) + 1 : ary.length / 2
  first_half = ary[0...half]
  second_half = ary[half..-1]

  [first_half, second_half]
end

# test cases:
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]