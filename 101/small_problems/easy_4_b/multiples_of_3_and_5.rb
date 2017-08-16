# multiples of 3 and 5

# Write a method that searches for all multiples of 3 or 5
# that lie between 1 and some other number,
# and then computes the sum of those multiples.
# For instance, if the supplied number is 20,
# the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

# understanding the problem
# input
#   int: number
# output
#   int: all the multiples summed

# questions
# what is a multiple?
#   a number that can be divided by another number without a remainder

# algorithm
# find the multiples of 3 up to the number
# x = 1
# while multiple < number
#   3 * x = multiple
#   threes << multiple
#   x += 1
# end
