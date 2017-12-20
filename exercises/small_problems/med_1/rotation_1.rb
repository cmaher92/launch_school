# Rotation (Part 1)

# Write a method that rotates an array by moving the first element
# to the end of the array. The original array should not be modified.
# Do not use the method Array#rotate or Array#rotate! for your implementation.

# input
#  array
# output
#   new array with the first element of the array added to the end

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

# Further exploration
# Write a method that rotates a string instead of an array
# do the same for integers

def rotate_obj(obj)
  obj.is_a?(String) ? obj.chars.rotate.join : obj.digits.reverse.rotate.join.to_i
end


# p rotate_obj('connor') == 'onnorc'
# p rotate_obj(1234)     == 2341
# Example:
# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]  # => true
# x == [1, 2, 3, 4]
