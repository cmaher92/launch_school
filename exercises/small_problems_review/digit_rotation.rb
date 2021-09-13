# Rotation (Part 2)

# PROBLEM
# - Rotate the last 'n' number of digits
# Details:
# Input:
# - Int (digits)
# - Int (n) number of digits to rotate
# Output:
# - Int (rotated) digits after rotation
# Requirements:
# - If 'n' is 1, original number is returned
# - 'n' will always be positive
# - need to handle when 'digits' is negative

# EXAMPLES
# digits: 9    n: 1 --> 9
# digits: 98   n: 2 --> 89
# digits: 987  n: 2 --> 978
# digits: 0    n: 1 --> 0
# digits: -987 n: 3 --> -879

# DATA STRUCTURE
# negative: boolean, if digits is negative, used to keep track
# unrotated: array, to hold the digits that will not be rotated
# to_rotate: array, digits to be rotated

# ALGORITHM
# 1. Assign a flag if digits are negative
# 2. Retrieve last n digits
#    - covert 'digits' into a string
#    - slice! the last 'n' digits from 'digits'
# 4. Rotate 'last_digits'
# 5. Combine digits and rotated_digits strings together
# 6. If 'digits' was negative, append a negative sign
# 7. Convert back to an integer and return
def rotate_array(unrotated)
  unrotated[1..] + [unrotated.first]
end

def rotate_rightmost_digits(digits, n)
  negative = false

  if digits.negative?
    digits = digits.abs
    negative = true
  end

  all_digits = digits.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])

  negative ? -(all_digits.join.to_i) : all_digits.join.to_i
end



p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
p rotate_rightmost_digits(-735291, 6) == -352917
