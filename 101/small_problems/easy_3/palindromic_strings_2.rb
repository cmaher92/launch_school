# palindromic strings 2

require 'pry'

# write anpther method that returns true of the string passed as an argument
# is a palindrome, false otherwise. This time, however, your method should be
# case-insensitive, and it should ignore all non-alphanumeric characters.
# If you wish, you may simplify things by calling the palindrome? method
# you wrote in the previous exercise.
def palindrome?(words)
  words == words.reverse
end

# understanding
# input
#   string
# output
#   boolean, whether or not the passed in string is a palindrome
# rules
#   case-insenitive
#   ignore all non-alphanumeric characters

# algorithm
# downcase the string
# strip all non-alphanumeric characters
#   scan the string and apply the regex /\w|\d/

def real_palindrome?(words)
  palindrome?(words.downcase.delete().join)
end

# test cases
puts "pass" if real_palindrome?('madam') == true
puts "pass" if real_palindrome?('Madam') == true           # (case does not matter)
puts "pass" if real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts "pass" if real_palindrome?('356653') == true
puts "pass" if real_palindrome?('356a653') == true
puts "pass" if real_palindrome?('123ab321') == false
