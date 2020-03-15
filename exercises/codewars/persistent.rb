# Write a function, persistence, that takes in a
# positive parameter num and
# returns its multiplicative persistence,
# which is the number of times you must multiply the digits
# in num until you reach a single digit.

# input; integer
# output; int

# result - the product of the multiplication
# loop until result is less than ten or a single digit
#   take the num and split into digits, if length is 1 return num
#   set the result to the outcome of multiplying all the digits

def persistence(num)
  return 0 if num < 10
  1 + persistence(num.digits.reduce(&:*))
end

# For example:

 p persistence(39) # returns 3, because 3*9=27, 2*7=14, 1*4=4
                 # and 4 has only one digit

 p persistence(999) # returns 4, because 9*9*9=729, 7*2*9=126,
                  # 1*2*6=12, and finally 1*2=2

 p persistence(4) # returns 0, because 4 is already a one-digit number
