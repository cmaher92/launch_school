# Practice Problem 12
# Given the following data structure, and without using the Array#to_h method,
# write some code that will return a hash where the key is the first item in
# each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

# input
#   array, with both hashes and sub-arrays
# output
#   hash, first element is key in each sub-array, second element is value

# given an array of subarrays containing 2 objects
# iterate over each subarray, with an object which will be a hash
#   the first value in the subarray becoems the key, the second the value

arr.each_with_object({}) do |sub_arr, hash|
  hash[sub_arr[0]] = sub_arr[1]
end
