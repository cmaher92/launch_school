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

# arr = given the number, split into arr and reverse
# loop over the array, starting at 0, ending at 1 less than the size of arr
# sub_arr = retrieve the section of the array that needs to be rotated
# rotate the sub_arr
# pass this into the rotate_array method which returns an arr
# save the sub_arr back to the arr defined before the loop
# here you will save using assignment arr[index..-1] = sub_arr
# return the arr
def max_rotation(num)
  arr = num.digits.reverse
  0.upto(arr.size - 1) do |i|
    sub_arr = arr[i..-1]
    rot_arr = sub_arr[1..-1] + [sub_arr[0]]
    arr[i..-1] = rot_arr
  end
  arr.join.to_i
end

# further exploration
# If I didn't have the rotate_array method or the rotate_rightmost_digits
# I would simply take the sub_arr and rotate it manually within the loop
# The rotate_array method serves it's purpose by abstracting some of the logic
# from this problem to simplify the understanding. Rotating in line would be
# less clear to somebody else reading the problem.

# In my original solution I opted for rotate_array method because
# it was fresher in my mind as opposed to the rotate_rightmost_digits
# I also think that rotate_rightmost_digits is less clear in terms of
# the naming of the function.

# Once I replaced my rotate array method you can see how the logic becomes
# more confusing.
# rot_arr = rotate_array(sub_arr)
# becomes
# rot_arr = sub_arr[1..-1] + [sub_arr[0]]


def max_rotation(number)
  number_digits = number.to_s.size
  number_digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end

# Now looking at Launch School's solution they used
# rotate_rightmost_digits(number, n) within a loop
# the first line within their function retrieves the size of the number
# they then begin a loop that starts at the length of the number
#   this loop will run until 2, meaning the last iteration will only rotate
#   the final 2 values in the arr

# The benefits of this solution are that each iteration is returning an
# Integer, as opposed to the rotate_array 

# Example:
p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
