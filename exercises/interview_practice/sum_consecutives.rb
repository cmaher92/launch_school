# sum consecutives

# input:
#   - Array of integers
# output:
#   - Array of integers
# rules/constraints:
#   - numbers that are the same and appear consecutively should be summed
#     - [3, 3, 3] -> [12]
#     - [3, 3, 1, 1] -> [6, 2]
#   - negative numbers should also be summed
#     - [-5, -5] -> [-10]
# algorithm/data structure:
#   - set local variable 'result' as an empty array
#   - iterate over the list of numbers w/ index
#     - check if last number is the same as current unless current index is 0
#     - IF same as last
#       - increment last element in 'result' array by current element
#     - ELSE
#       - add current character to result array
#   - return result array

def sum_consecutives(arr)
  result = []
  arr.each_with_index do |n, i|
    if i != 0 && arr[i - 1] == n
      result[-1] += n
    else
      result << n
    end
  end
  result
end

p sum_consecutives([1,4,4,4,0,4,3,3,1, 1]) == [1,12,0,4,6,2]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]
