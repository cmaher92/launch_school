=begin
You have an array of numbers.
Your task is to sort ascending odd numbers but even numbers must be on their
places.

Zero isn't an odd number and you don't need to move it.
If you have an empty array, you need to return it.

sort the odd numbers
given an array
sort the numbers that are odd

input
  array
output
  sorted_array

create a new local array
iterate over given array
  if number is odd
    place nil in new array
  if number is even
    place the number in the new array
now, select only the odd numbers and sort them in ascending order
map the newly created array
  if the obj is nil
    replace it with the first of the odds
  otherwise
    keep it the same
return the newly created array

refactor
So, this would be easier if you simply selected all the odds and sorted them
then map the array, replacing all odd numbers with each number in the
sorted_odds list
=end

require 'pry'

def sort_array(arr)
  sorted_odds = []
  arr.each do |num|
    num.odd? ? sorted_odds << nil : sorted_odds << num
  end
  odds = arr.select { |num| num.odd? }.sort
  sorted_odds.map { |num| num == nil ? odds.shift : num }
end



# Example
p sort_array([5, 3, 2, 8, 1, 4]) == [1, 3, 2, 8, 5, 4]
p sort_array([5, 3, 2, 8, 1, 4]) == [1, 3, 2, 8, 5, 4]
