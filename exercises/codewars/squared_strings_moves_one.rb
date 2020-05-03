# moves in squared strings 1
# codewars
# 7 kyu

# This is the first of a sequence of four problems about squared strings

# vertical mirror
# < String; squared
# > String; vertically mirrored
# ! vertically mirrored means reversing each character within a substring
# ! must be defined as a lambda
# algorithm
#   - split string on newline characters
#   - reverse each substr
#   - join together

# in-place
# left and right index initialized to 0
# loop while right_index is less than length of string
#   - check if current character at right_index is new line
#     - case newline
#     - reverse from left_index to right_index, excluding current character
#     - left_index, right_index = right_index + 1
#     - case not new line
#     - right_index += 1
#     - if right_index == length - 1
#       - reverse from left_index to right_index
#       - break

vert_mirror = lambda do |str|
  left_index, right_index = 0, 0
  
  loop do
    if str[right_index] == "\n"
      str[left_index...right_index] = str[left_index...right_index].reverse
      left_index = right_index + 1
    end
    right_index += 1
    if right_index == str.length - 1
       str[left_index..-1] = str[left_index..-1].reverse 
      break
    end
  end
  
  str
end

hor_mirror = lambda do |str|
  left_index, right_index = 0, (str.length - 1)
  while left_index < right_index
    str[left_index], str[right_index] = str[right_index], str[left_index]
    left_index += 1
    right_index -= 1
  end
  vert_mirror.call(str)
end

def oper(fct, str)
  fct.call(str)
end


p oper(hor_mirror, "abcd\nefgh\nijkl\nmnop")
# p hor_mirror.call("abcd\nefgh\nijkl\nmnop")
# p vert_mirror.call("abcd\nefgh\nijkl\nmnop")