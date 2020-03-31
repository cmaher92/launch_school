# Running totals

# Write a method that takes an Array of numbers,
# and returns an Array with the same number of elements, 
# and each element has the running total from the original Array.

=begin
input
  - array of ints
output
  - array of ints
rules
  - each element in the returned array is the running total sum
  - from the previous elements
  - [1, 2, 3] => [1, 3, 6]
data structure
  - array, so I can map
algorithm
  - create an integer to store running total
  - map each item of the passed in array
    - the block should return the total + current_item
  - return newly mapped array
=end

# my solution
# def running_total(arr)
#   total = 0
#   arr.map { |i| total += i }
# end

# with each_with_object
# def running_total(arr)
#   total = 0
#   arr.each_with_object([]) do |i, arr|
#     arr << total += i
#   end
# end

require 'pry'
def running_total(numbers)
  numbers.each do |number|
    numbers.reduce(0, :+) + number
  end
end

# Tests:
p running_total([2, 5, 13]) #== [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) #== [14, 25, 32, 47, 67]
p running_total([3]) #== [3]
p running_total([]) #== []