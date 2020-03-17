# Practice Problem 15
# Given this data structure write some code to return an array which contains
# only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# input
  # array of hashes
# output
  # array of hashes that contain only even integer values

# select array with local variable hash
  # use #all function to iterate over hash and see if each value is true
    # use #all again to check each number with hash's arr value

evens = arr.select do |hash|
  hash.all? do |key, value|
    value.all? do |num|
      num.even?
    end
  end
end

p evens
