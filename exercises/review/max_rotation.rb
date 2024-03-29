require 'pry'
require_relative 'digit_rotation'
# input: n (int)
# output: n_rotated (int)
# rules:
# - with each subsequent rotation another digit from LTR is becomes 'fixed'
#   in place and is no longer part of future rotations.
# - in some cases leading 0's will get dropped 105 -> 15

# algorithm:
# 1. initialize counter variable to the size of 'n'
# 2. until 'n' is 0
#   2a. rotate_rightmost_digits(n, size)
#   2b. decrement 'size'
# 3. return 'n'

def max_rotation(n)
  rotated = n
  size = n.to_s.size

  while size > 0 do
    rotated = rotate_rightmost_digits(rotated, size)
    size -= 1
    rotated
  end

  rotated
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
