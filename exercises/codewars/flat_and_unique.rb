=begin
  Given an array of arrays, write a method that returns a flattened array with all duplicate values removed.

  Example:
    flatAndUnique([[1,2,3], [1,4,5], ['a', 2, 'c'], ['a', 7]])

    => [1,2,3,4,5,'a', 'c', 7]

  You cant use the array.flatten method or the built in unique method

  input
    array of arrays
  output
    flattened array with only unique values


  given an array of arrays
  take all the elements from inside the subarrays
  place into an array

  create a hash with a default value of 0
  iterate over the array
  iterate over the subarray
    place each element into the hash
  turn the hash to keys and return
=end

def flat_and_unique(arr)
  hash = Hash.new(0)

  arr.each do |subarr|
    subarr.each do |obj|
      hash[obj] += 1
    end
  end

  p hash.keys
end

# def flat_and_unique(arr)
#   flattened_arr = []
#   #
#   arr.each do |subarray|
#     subarray.each do |item|
#       flattened_arr << item unless flattened_arr.include?(item)
#     end
#   end
#   p flattened_arr
# end

flat_and_unique([[1,2,3], [1,4,5], ['a', 2, 'c'], ['a', 7]])
