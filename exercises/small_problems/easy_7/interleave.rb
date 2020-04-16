# combine two lists

# input: 2 arrays
# output: array
# rules:
#   - elements in new array taken in alternation
#   - input arrays will not be empty
#   - input arrays will be the same length

# algorithm:
#   iterate over a range from 0 to the length of one inputted array, exclusing that number
#   iterate over range with an object
#   append each element with the passed in number to the new array
#   return new array
require 'pry'

# def interleave(arr1, arr2)
#   (0...arr1.length).each_with_object([]) do |idx, arr|
#     arr << arr1[idx] << arr2[idx]
#   end
# end

# rewrite interleave to use zip
def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
