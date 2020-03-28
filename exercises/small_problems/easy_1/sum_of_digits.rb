# Sum of Digits
# Write a method that takes one argument, a positive integer, 
# and returns the sum of its digits.

# - Input
#   - Integer
# - Output
#   - Integer - sum of the inputs digits
# - Rules
#   - write without using any basic looping constructs (while, until, loop, and each)
#   - input will be positive

# - Data structure
#   - Array: will need to split the digits up to be able to sum them
# - Algorithm
#   - initialize an array to store the digits
#   - divmod the number, adding the remainder to the array
#   - recursively call self passing the array and the quotient
#     - break when the quotient is 0

def sum(n, arr=[])
  q, r = n.divmod(10)
  arr << r
  sum(q, arr) if q != 0
  arr.reduce(:+)
end

# - Tests
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45