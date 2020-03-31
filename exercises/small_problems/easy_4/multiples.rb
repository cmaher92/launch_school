# Multiples of 3 and 5

=begin

Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, 
and then computes the sum of those multiples. 
For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).
You may assume that the number passed in is an integer greater than 1.

Input
  Integer 
Output
  Integer, result of reducing all numbers between 1..n that are divisble by 3 or 5
Rules
Data Structure
  Array, lends itself to reduce and easily create a list of nums divisble by 3 or 5
Algorithm
  - create an array from 1..n
  - select numbers that either are evenly divisble by 3 or 5
  - reduce to the sum of all the numbers
=end

def multisum(n)
  (1..n).select { |i| i % 3 == 0 || i % 5 == 0 }.reduce(:+)
end

# Tests
p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168