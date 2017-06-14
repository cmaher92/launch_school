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
puts "pass" if oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts "pass" if oddities(['abc', 'def']) == ['abc']
puts "pass" if oddities([123]) == [123]
puts "pass" if oddities([]) == []

# understanding
# input
#   arr with n number of elements
# output
#   arr with only the even elements from the original array

# algorithm
# evens array
# index
# remove odd elements
#   loop over array while the original arrays length is not 0
#     if index is even, remove element
#     if index is odd, add to evens array
#     increment index
# return evens array

# def evens(arr)
#   evens = []
#   index = 0
#   while arr.length > 0
#     arr.shift if index.even?
#     evens << arr.shift if index.odd?
#     index += 1
#   end
#   evens
# end

# algorithm
# evens array
# index
# while index is less than the size of the original array
#   add element from the array at the specified index
# return array

def evens(arr)
  even_elements = []
  index = 1

  while index < arr.size
    even_elements << arr[index]
    index += 2 # this skips every other, so we just get the odd indices
  end

  even_elements
end

puts "pass" if evens([2, 3, 4, 5, 6]) == [3, 5]
puts "pass" if evens(['abc', 'def']) == ['def']
puts "pass" if evens([123]) == []
puts "pass" if evens([]) == []
