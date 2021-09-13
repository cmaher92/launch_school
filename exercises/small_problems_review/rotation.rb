# Rotation (Part 1)

# PROBLEM:
# Input: array of objects
# - [9, 3, 5, 2]
# - ['a', 'b', 'c']
# Output: new array of objects
# Requirements:
# - Move the first element to the end of the array
# Rules:
# - Not mutating
# - Do not use Array#rotate or Array#rotate!

# EXAMPLES:
# -  ['a', 'b', 'c'] --> ['b', 'c', 'a']
# -  ['a']           --> ['a']
# -  []              --> []

# DATA STRUCTURE
# - rotated = []
# - first   = first element in the unrotated array

# ALGORITHM
# 1. Given 'unrotated' array of objects
# 2. Retrieve the element's in the array excluding the first element
# 3. Retrieve the first element in the array
# 4. Combine the retrieved values from step 2 with the first element in 'unrotated'
# 5. Return newly 'rotated' array

def rotate_array(unrotated)
  unrotated[1..] + [unrotated.first]
end

# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true

# FURTHER EXPLORTATION
# Write a new method that rotates a string instead of an array.

# PROBLEM
# Details:
# - Rotate the first letter of a string to the end of the string
# Input:
# - String
# Output:
# - New String that has been rotated
# Requirements:
# - Do not mutate
# - When working with empty string, slicing methods will return nil

# EXAMPLES
# unrotated: 'connor' --> 'onnorc'
# unrotated: 'c' --> 'c'
# unrotated ''   --> ''

# DATA STRUCTURE

# ALGORITHM
# 1. Return empty string if string is empty
# 2. Retrieve substring containing all characters after the first element
# 3. Retrieve first character
# 4. Combine retrieved substrings from steps 2 & 3 and return

def rotate(unrotated)
  return '' if unrotated.empty?
  unrotated[1..-1] + unrotated[0]
end

p rotate('connor') == 'onnorc'
p rotate('c')      == 'c'
p rotate('')       == ''
p rotate('cow')    == 'owc'
