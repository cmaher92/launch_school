# multiples of 3 and 5

# Write a method that searches for all multiples of 3 or 5 that lie between 1 
# and some other number, and then computes the sum of those multiples. For 
# instance, if the supplied number is 20, 
# the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

# understanding
# input
#   integer: some number greater than 1
# output
#   integer: sum of the multiples of 3 or 5 from 1 to the inputted integer

# algorithm
# create array from 1 to number
# remove non-multiples of 3 or 5
#   Array#select and if element is not % by 3 or 5 return false
# sum all the numbers that remain in the array and return
#   Enum#inject

def multisum(num)
  arr = (1..num).to_a
  arr.select! { |element| (element % 3 == 0) || (element % 5 == 0) }
  arr.inject(:+)
end

# test cases
puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168