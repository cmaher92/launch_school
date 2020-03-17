=begin
Halvsies

Write a method that takes an Array as an argument,
and returns two Arrays that contain the first half and second half
of the original Array, respectively.
If the original array contains an odd number of elements,
the middle element should be placed in the first half Array.

input
  array
output
  two arrays that contain the first half and second half respectively
rules
  if there is an odd number of elements the middle should be put in the first
  half of the array

given an array
  find the halfway point
    divide the array by 2, if it's odd add + 1 to the quotient
  return [arr[0..n]], [arr[n+1..-1]]
=end
require 'pry'

def halvsies(arr)
  arr.length.odd? ? n = (arr.length / 2) + 1 : n = arr.length / 2
  [arr[0..(n-1)], arr[(n)..-1]]
end

# Examples:
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
