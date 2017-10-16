# multiples of 3 and 5

require 'pry'

# Write a method that searches for all multiples of 3 or 5
# that lay between 1 and some other number,
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
#   abstract to a func
# find the multiples of 5 up to the number
#   abstract to a func
# combine both arrays
# sum contents of combined array

# def find_threes(number)
#   p = 0
#   x = 1
#   threes = []
#   while p <= number
#     threes << p
#     p = 3 * x
#     x += 1
#   end
#   threes
# end
#
# def find_fives(number)
#   p = 0
#   x = 1
#   fives = []
#   while p <= number
#     fives << p
#     p = 5 * x
#     x += 1
#   end
#   fives
# end
#
# def multisum(number)
#   # find the multiples of three and five up to the number
#   threes = find_threes(number)
#   fives  = find_fives(number)
#
#   # combine arrays, remove common multiples so there isn't repeats, sum
#   multiples = (threes << fives).flatten
#   multiples.uniq!.reduce(:+)
# end

# provided solution
# also included in notes becuase the solution is incredibly elegant
# what stands out is the usage of Int#upto along with the || conditional
# also the abstraction of the multiple? function can easily make this
# whole problem work for any multiples
def multiple?(number, divisor)
  number % divisor == 0
end

def multisum(max_limit)
  sum = 0
  1.upto(max_limit) do |number|
    if multiple?(number, 3) || multiple?(number, 5)
      sum += number
    end
  end
  sum
end



# test cases
puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
