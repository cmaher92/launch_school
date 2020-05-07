# Create a method called "power" that takes two integers and returns the value of the first argument 
# raised to the power of the second. Return nil if the second argument is negative.
# Note: The ** operator has been disabled.

# input:
#   - integer; number
#   - integer; this represents the power
# output:
#   - integer; result
# constraints:
#   - if second number is 0, return 1
#   - if result is Rational return nil
# mental model:
#   - set result to store result defaulted to 1
#   - multiply number by itself m times, m being the second input
#   - return result
# algorithm/data structure:
#   -

def power(base, exponent)
  result = 1
  exponent.times { result *= base }
  exponent >= 0 ? result : nil
end

# Examples:
p power(2, 3) # 8
p power(10, 0) # 1
p power(-5, 3) # -125
p power(-4, 2) # 16
