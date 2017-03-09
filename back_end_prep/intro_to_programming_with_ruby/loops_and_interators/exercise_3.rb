# Exercise 3
# Ruby Loops and Iterators

# Use the each_with_index method to iterate through an array of your creation that prints each index and value of the array.

array = ['a', 'b', 'c', 'd']

array.each_with_index do |index, item|
  puts "index: #{index} value: #{item}"
end

