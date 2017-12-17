=begin
Multiply Lists

Write a method that takes two Array arguments in which each Array contains a
list of numbers, and returns a new Array that contains the product of each
pair of numbers from the arguments that have the same index.
You may assume that the arguments contain the same number of elements.

input
  2 arrays which contain a list of numbers
output
  array that contains the produce of each pair of numbers from
  elements with the same index
rules
  you can assume that the arrays contain the same number of elements

given two arrays
init a results array
set a counter to 0
loop up to the length of the arr
  retrieve the item from each array in the idex position defined by counter
  multiply
  append to results array

return results array
=end

# def multiply_list(arr, arr2)
#   results = []
#
#   0.upto(arr.size - 1) do |idx|
#     results << arr.fetch(idx) * arr2.fetch(idx)
#   end
#
#   results
# end

=begin
Further Exploration

The Array#zip method can be used to produce an extremely compact solution to
this method. Read the documentation for zip, and see if you can come up with
a one line solution (not counting the def and end lines).

# zip the two arrays together, map each subarr, reduce (:*)
=end

def multiply_list(arr, arr2)
  arr.zip(arr2).map { |subarr| subarr.reduce(:*) }
end

# Examples:
p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
