=begin
Find the Duplicate

Given an unordered array and the information that exactly one value in the 
array occurs twice (every other value occurs exactly once), 
how would you determine which value occurs twice? Write a method 
that will find and return the duplicate value that is known to be in the array.

input
  array of integers, there is exactly one repeated integer
output
  integer, the duplicate number
  
given an array of numbers
for each element in the array 
  check the current element against the array without the current element in it
  check before the current index
  check after the current index
=end

# def find_dup(arr)
#   arr.each.with_index do |element, idx|  
#     return element if arr[0...idx].include?(element) || arr[(idx+1)..-1].include?(element)
#   end
# end
require 'pry'

def find_dup(array)
  array.find { |element| array.count(element) == 2 }
end


p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73








=begin
Solution

def find_dup(array)
  array.find { |element| array.count(element) == 2 }
end
Discussion

Here we're using the method Enumerable#find to look through each item in our array. 
If that item meets some condition we return it. 
In this case, the condition we check is that that item occurs twice. 
This bit of code will allow us to find the duplicate element regardless of the size of the array.

Further Exploration

There are several ways to go about solving this problem. 
One other way would be to have a separate array that keeps track of which items
have been looked at as we iterate through the original array.
If we ever add the same item twice to this second array, 
then we know that we have found a duplicate.

How did you end up solving this one?
=end
