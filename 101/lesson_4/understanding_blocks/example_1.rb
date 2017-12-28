[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end

# So what's happening in this, seemingly simple, piece of code?
# Take it apart and try to describe every interaction with precision.

# A multi-dimensional array calls the each method
# each inner array is passed into the block and assigned as the local var 'arr'
# within the block the subarray is calling the first method,
#   returning the first value in the subarr
# the block is then printing this value as a string using the puts methods
