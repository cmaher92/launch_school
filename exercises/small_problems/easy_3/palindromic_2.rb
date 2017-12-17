# Palindromic Strings (Part 2)
#
# Write another method that returns true if the string passed as an argument
# is a palindrome, false otherwise. This time, however, your method should be
# case-insensitive, and it should ignore all non-alphanumeric characters.
# If you wish, you may simplify things by calling the palindrome? method
# you wrote in the previous exercise.

require_relative 'palindromic_strings'

# given a string
# downcase the string and pass to palindrome? function

# def real_palindrome?(str)
#   # downcase
#   str = str.downcase
#   # ignore alphanumeric characters
#   str = str.scan(/[a-z]/).join
#   palindrome?(str)
# end

# Use String#delete to delete all alphanumeric characters
def real_palindrome?(str)
  str = str.downcase
  str = str.delete(",.' ", '^a-z')
  palindrome?(str)
end


# Test cases
puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false
