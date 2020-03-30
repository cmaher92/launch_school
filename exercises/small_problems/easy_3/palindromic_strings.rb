# Palindromic Strings (Part 1)
# Write a method that returns true if the string passed as an argument is a palindrome, 
# false otherwise. 
# A palindrome reads the same forward and backward. 
# For this exercise, case matters as does punctuation and spaces.

# - Input:
#   - string
# - Output:
#   - boolean
#     - true if panindrome, false otherwise
# - Rules:
#   - case matters
#   - all characters matter
# - Data Structure:
#   - String, use because its passed in and easily reversed
# - Algorithm:
#   - compare inputted string to inputted string reversed
#   - return result

def palindrome?(str)
  str == str.reverse 
  
end

# Examples:
p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true