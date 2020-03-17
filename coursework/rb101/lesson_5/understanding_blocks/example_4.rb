my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

# Line	Action	Object	Side Effect	Return Value	Is Return Value Used?
# 1, local variable assignment, none, the array, no
# 1, method call, multi-dimensional array, calling array, yes, assigned to local
#    variable 'my_arr'
# 1-6, block execution, each sub-array, none, nil, no
# 2, method call, sub-array, none, subarray, yes, used to determine
#    return value of outer block
# 3, comparison (< ), num and integer 5, none, boolean, yes evaluated by if
# 3, conditional (if), number from sub-array and an integer 5, executes block if
#    #if returns true, boolean, yes to determiine if block should execute
# 2-5, block execution, each object in sub-array, none, nil, no
# 4, puts method, integer within sub-array, outputs string representation of
#   integer, nil, no
