[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

# Line	Action	Object	Side Effect	Return Value	Is Return Value Used?
# 1, method call, multi-dimensional array, returns new array,
# new array [1, 3], no but shown on line 5
# 1-3, block execution, each sub-arr, element at index 0,
# yes used by map for transmformation
# 2, method call, sub-array, none, element at index 0, yes, by puts
# 2, method call, element at index 0, outputs string representation of element
#    at index 0, nil, no not used
# 3, method call, sub-array, none, element at index 0,
#   yes, used by map for transformation
