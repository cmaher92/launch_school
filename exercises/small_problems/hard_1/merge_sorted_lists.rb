# Write a method that takes two sorted Arrays as arguments, 
# and returns a new Array that contains all elements from both arguments in sorted order.

# You may not provide any solution that requires you to sort the result array. 
# You must build the result array one element at a time in the proper order.

# input:
#   (x2) Array of integers
# output:
#   Array of integers; merged from the two arrays passed in
# rules:
#   - you may not provide any solution that requires sorting the result array
#   - you must build the result array one element at a time
#   - do not mutate the input arrays
# algorithm:
#   create results array the size of the inputs combined
#   replace each value in the results array with the corresponding smallest value from input arrays
#   output results array
# psuedocode:
#   create new array passing in the size of each input array summed
#   map the results array, replacing nil values with values from input arrays
#     - set a_index, b_index to 0
#     - set a_max, b_max to the size of the array - 1
#     - if a_index is <= a_max and b_index is <= b_max
#       - if element at a_index < element at b_index
#         - increment a_index
#         - next, passing in element at a_index
#       - else 
#         - increment b_index
#         - next, passing in element at b_index
#     - else (one of the inputs is exhausted)
#       - if a_index == a_max (a array is exhausted)
#         - increment b_index
#         - next, passing element at b_index
#       - else (b array is exhausted)
#         - increment a_index
#         - next, passing in element at b_index

def merge(a, b)
  result = Array.new(a.size + b.size)
  a_index, b_index = 0, 0
  a_max = a.size - 1
  b_max = b.size - 1
  
  result.map do
    if a_index <= a_max && b_index <= b_max
      if a[a_index] < b[b_index]
        a_index += 1
        next a[a_index - 1]
      else
        b_index += 1
        next b[b_index - 1]
      end
    else
      if a_index > a_max
        b_index += 1
        next b[b_index - 1]
      else
        a_index += 1
        next a[a_index - 1]
      end
    end
  end

end

# Your solution should not mutate the input arrays.
# Examples:
p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
