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

# Algorithm:
# 1. Convert 'digits' to an array of integers in the correct order
#    - 123456 -> [1, 2, 3, 4, 5, 6]
# 2. Rotate the last 'n' digits
# 3. Convert 'all_digits' back to an integer
# 4. Return

def rotate_array(unrotated)
  unrotated[1..] + [unrotated.first]
end

def to_int(digits)
  counter = 0
  result  = 0

  loop do
    break if counter == digits.size

    result += digits[counter] * (10**counter)

    counter += 1
  end
  
  result
end

def rotate_rightmost_digits(digits, n)
  all_digits = digits.digits.reverse
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  to_int(all_digits.reverse)
end

# p rotate_rightmost_digits(735291, 1)   == 735291
# p rotate_rightmost_digits(735291, 2)   == 735219
# p rotate_rightmost_digits(735291, 3)   == 735912
# p rotate_rightmost_digits(735291, 4)   == 732915
# p rotate_rightmost_digits(735291, 5)   == 752913
# p rotate_rightmost_digits(735291, 6)   == 352917
