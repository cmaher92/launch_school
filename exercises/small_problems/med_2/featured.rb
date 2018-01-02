# Next featured number higher than a given value

# A featured number (something unique to this exercise)
# is an odd number that is a multiple of 7, and whose digits
# digits occur exactly once each. So, for example, 49 is a featured number
# but 90 is not (it isn't odd), 97 is not (it is not a multiple of 7), and
# 133 is not (the digit 3 appears twice)

# Write a method that takes a single integer as an argument, and returns the
# next featured number that is greater than the argument.
# Issue an error message if there is no next featured number.

# inputs
  # integer
# outputs
  # integer
  # error message if there is no next featured number
# rules
#   featured number - multiple of 7, no repeat digits, odd

# mental model
# given an integer, find the next featured number that is greater than the
# inputted number. A featured number is a number that is a multiple of 7, is odd
# and has no repeat digits. 

# data structure
# set an integer to 0, calculate the multiples of 7, only save to the integer 
# once the number is greater than the inputted number, is odd, and digits are all 
# uniq

# algorithm
# 1. set a local variable to 0
# 2. return error message if n.digits > 9
# 3. loop unless local variable is not 0
#   I. num = i * 7
#   II. if num > n && num.odd? && num.digits.uniq.size == num.digits.size
#       i. set local variable to num
# 4. return local variable 
 
require 'pry'
  
def featured(n)
  featured = 0
  count   = 0
  return "There is no possible number that fulfills those requirements" if n > 9876543210
  until featured != 0
    count += 1
    num = count * 7
    if num > n && num.odd? && num.digits.uniq.size == num.digits.size
      featured = num
    end
  end 
  featured
end 

# test cases
p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1023456987
p featured(9_999_999_999)