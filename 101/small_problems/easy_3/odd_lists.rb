# odd lists

require 'pry'

# Write a method that returns an Array that contains every other element of an
# Array that is passed in as an argument.
# The values in the returned list should be those values that are
# in the 1st, 3rd, 5th, and so on elements of the argument Array

# understanding
# input
#   array
# output
#   array containing every other element of the original array

# algorithm
# select the elements from the array that are an even index
# return the new array

def oddities(ary)
  count = 0
  ary.select! do
    count += 1
    count.odd?
  end
  ary
end

# test cases
puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []


def evens(arr)
  index = 0
  evens = []
  while index < arr.size # this loop is wrong, its exiting early! 
    arr.shift if index.even?
    binding.pry
    evens << arr.shift if index.odd?
    binding.pry
    index += 1
  end
  p evens
end

puts evens([2, 3, 4, 5, 6]) == [3, 5]
puts evens(['abc', 'def']) == ['def']
puts evens([123]) == []
puts evens([]) == []
