# Rotation (part 3)

require_relative 'rotation'
require 'pry'

# < Integer
# > Integer
# ! returns maximum rotation of a number
# ! rotate the entire number
# ! rotate 1..-1 of the number
# ! rotate 2..-1 of the number
# ! until first is the length of the object
# &
# split the number into digits and reverse 123 -> [1, 2, 3]
# rotate the array of numbers until it reaches maximum rotation
#   - 0.upto(digits.length)
#     - each block pass the array from n to -1 to rotate_array method
#     - assign it back to the digits

def max_rotation(num)
  digits = num.digits.reverse
  0.upto(digits.size - 1) do |i|
    digits[i..-1] = rotate_array(digits[i..-1])
  end
  digits.join.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845