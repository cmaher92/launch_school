# Rotation (Part 1)
# Medium 1, problem 1

# Write a method that rotates an array by moving the first element to the end of the array. 
# The original array should not be modified.
# Do not use the method Array#rotate or Array#rotate! for your implementation.

# < Array of Integers
# > Array of Integers
# ! Do not use Array#rotate or Array#rotate!
# ! Move first element to the end of the array
# ! Do not modify the original object
# &
# reassign the arr local variable to the array from [1..-1] + [0]
# return

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end


# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# rotate_array(x) == [2, 3, 4, 1]   # => true
# x == [1, 2, 3, 4]             