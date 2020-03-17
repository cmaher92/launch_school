# Rotation (Part 2)

# Write a method that can rotate the last n digits of a number. For example:
# Note that rotating just 1 digit results in the original number being returned.
# You may use the rotate_array method from the previous exercise if you want. (Recommended!)
# You may assume that n is always a positive integer

# input
  #  2 integers, number to be rotated, number of digits to rotate
# output
  # integer, rotated digit
  
# 735291, 2
# 7 3 5 2 1 9 (rotates the second last digit)

require_relative 'rotation_1'
require 'pry'

# split the digits into an arr
# take n number of elements off the back of the array
# rotate those elements
# append those elements back to the orig arr
# return

# first attempt
# def rotate_rightmost_digits(num, n)
#   num_arr = num.digits.reverse
#   digits_to_rotate = []
#   (n).times do
#     digits_to_rotate.unshift(num_arr.pop)
#   end
#   return num if digits_to_rotate.size == 1
#   (num_arr + digits_to_rotate.rotate).join.to_i
# end

# refactored
# split the num into digits, pop(n), 

def rotate_rightmost_digits(num, n)
  arr = num.digits.reverse
  rotate_arr = rotate_array(arr.pop(n))
  (arr + rotate_arr).join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
