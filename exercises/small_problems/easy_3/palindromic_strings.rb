# Palindromic Strings (Part 1)
#
# Write a method that returns true if the string passed as an argument is a
# palindrome, false otherwise. A palindrome reads the same forward and backward.
# For this exercise, case matters as does punctuation and spaces.

# input
#   string - representing a palindrome
# output
#   boolean
#
# given a string
# reverse the string
# if compare is true
#   return true
# otherwise
#   return false

# def palindrome?(str)
#   str == str.reverse
# end

# Write a method that determines whether an array is palindromic; that is,
# the element values appear in the same sequence both forwards and backwards
# in the array.

# def palindrome?(arr)
#   arr == arr.reverse
# end

# Now write a method that determines whether an array or a string is
# palindromic; that is, write a method that can take either an array or a string
# argument, and determines whether that argument is a palindrome.

def palindrome?(obj)
  obj == obj.reverse
end

# # Examples:
# puts palindrome?('madam') == true
# puts palindrome?('Madam') == false          # (case matters)
# puts palindrome?("madam i'm adam") == false # (all characters matter)
# puts palindrome?('356653') == true
# puts palindrome?(%w(a b a)) == true
