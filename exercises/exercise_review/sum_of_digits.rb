# Sum of Digits

# Write a method that takes one argument,
# a positive integer, and returns the sum of its digits.

# input
  # positive integer
# output
  # sum of it's digits

# split the number into an list of digits
# iterate through the list adding them together
# return sum

# def sum(int)
#   int.digits.reduce(:+)
# end

# def sum(int)
#   split_sum = int.digits
#   sum = 0
#   split_sum.each do |x|
#     sum += x
#   end
#   sum
# end

# Examples:
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
# The tests above should print true.

# For a challenge, try writing this without any basic looping constructs
# (while, until, loop, and each).
