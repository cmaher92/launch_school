# Sum Square - Square Sum
# Write a method that computes the difference between the square of the sum of the first n positive integers 
# and the sum of the squares of the first n positive integers.

# input: integer
# output: integer
# rules:
# - expect positive integers

# algorithm
# - square of sum
# - sum of squares
# - initialize both variables and set to 0
# - loop from 1..n, inclusive
#   - add current number to sum
#   - square current number add to sum of squares
# - square the square_of_sum variable
# - find difference and return

def sum_square_difference(n)
  sum_of_squares = 0
  sum            = 0

  n.times do |i|
    i = i + 1
    sum += i
    sum_of_squares += i**2
  end

  (sum_of_squares - sum**2).abs
end

# Examples:
p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
