# Rotation (Part 3)

# If you take a number like 735291, and rotate it to the left, you get 352917. 
# If you now keep the first digit fixed in place, and rotate the remaining digits, 
# you get 329175. Keep the first 2 digits fixed in place and rotate again to 
# 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. 
# Finally, keep the first 4 digits fixed in place and rotate the final 2 digits 
# to get 321579. The resulting number is called the maximum rotation of the 
# original number.

# Write a method that takes an integer as argument, 
# and returns the maximum rotation of that argument. 
# You can (and probably should) use the rotate_rightmost_digits method 
# from the previous exercise.

require_relative 'rotation_1'
require 'pry'

def max_rotation(num)
  # split num to digits, reverse, assign to arr
  # 0.upto(arr.size - 1) do |i|
    # arr = arr[i..-1]
  # arr.join.to_i
  arr = num.digits.reverse
  0.upto(arr.size - 1) do |i|
    binding.pry
    arr = rotate_array(arr[i..-1])
  end
  arr.join.to_i
end

# Example:
p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845