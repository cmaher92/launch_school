# input
#   - Array
# output
#   - original array
# algo
#   - each takes an array and a block
#   - given the array
#     - iterate over array
#     - invoke the block passing in element as arg
#   - return passed in array

def each(arr)
  counter = 0
  
  while counter < arr.length
    yield(arr[counter])
    counter += 1
  end
  
  arr
end

each(%w(a b c)) { |letter| puts letter }