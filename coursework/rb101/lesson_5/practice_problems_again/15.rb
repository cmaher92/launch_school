# Given this data structure write some code to return an array which contains only the hashes where all the integers are even.
require 'pry'

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# input: array
# output: array: contains only the hashes where all the integers are even
# rules
#   - data object is nested
#     - array of hashes
#     - key is a symbol, value is an array
# algorithm
#   select (only hashes where the value array is all even numbers)
#    - each block should return true if all values arrays contain even numbers (multiple arrays)

p arr.select { |hash| hash.all? { |_, value| value.all? { |num| num.even? } } }