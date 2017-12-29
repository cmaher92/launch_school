arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end

# method call (sort_by), entire array, no side-effect, sorted_array
# block execution, object is each sub_arr, no side-effect, return value
#   is used by #sort_by to determine what to sort on.
# method call (map), sub_arr, no side-effect, modified sub_arr, return value
#   used by outer block execution
# block execution, string representation of a number, no side-effect, return value
#   is used by #map to transform the sub-arr
# method call (to_i), called on the string representation of the number,
#   no side-effect, return value is an integer, integer is used by block execution
