# Practice Problem 13
# Given the following data structure,
# return a new array containing the same sub-arrays as the original
# but ordered logically according to the numeric value of the odd integers
# they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
# The sorted array should look like this:
# [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

# input
#   array of arrays
# output
#   array ordered by numeric value of the odd integers

arr.sort_by { |sub_arr| sub_arr.select { |num| num.odd? } }

# the select statement within the block execution will return an array
# that only contains odd values, the sort_by method then moves around the
# original passed in sub_arrays according to what the order of the
# odd sub_arrays come back as. 
