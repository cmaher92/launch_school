require_relative 'rotation'
require 'pry'

# < Integer; number
# < Integer: number of digits to rotate
# ! rotation begins from the right
# ! you may assume that number is always positive
# &
# convert to an array
# rotate digits_to_rotate
#   reference the number of digits starting from 0
#   reverse the subarr, as it will be backwards
#   pass the returned array to the rotate_array method
#   reassign the returned value from rotate_array
# join, reverse, and convert back to an integer

def rotate_rightmost_digits(num, nums_to_rotate)
  num = num.digits.reverse
  num[-nums_to_rotate..-1] = rotate_array(num[-nums_to_rotate..-1])
  num.join.to_i
end

# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917