# Practice Problem 11
# Given the following data structure use a combination of methods,
# including either the select or reject method,
# to return a new array identical in structure to the original but
# containing only the integers that are multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

# input
#   array of arrays
# output
#   array of arrays, but the sub-arrays can only return values that are
#   multiples of 3

# map each sub_arr in the arr
#   select each number in the sub_arr
#      num modulus 3 == 0

new_arr = arr.map do |sub_arr|
  sub_arr.select do |num|
    num % 3 == 0
  end
end

p new_arr
