# input
# - 2 arrays with same number of elements
# output
# - single array of 2-element arrays as elements
# rules
# - arguments should not be mutated
# - dont use built in #zip method
# algo
# - create new array specifying the size as the size
#   of one of the passed in arrays
# - initialize a counter and set to 0
# - loop until counter is size of array
# - return result

def zip(arr1, arr2)
  Array.new(arr1.size) do |idx|
    [arr1[idx], arr2[idx]]
  end
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
