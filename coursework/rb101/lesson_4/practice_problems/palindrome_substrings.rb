# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Some questions you might have?
# 1. What is a substring?
# 2. What is a palindrome?
# 3. Will inputs always be strings?
# 4. What does it mean to treat palindrome words case-sensitively?

# input: string
# output: an array of substrings
# rules:
#      Explicit requirements:
#        - return only substrings which are palindromes.
#        - palindrome words should be case sensitive, meaning "abBA"
#          is not a palindrome.

# Data structure
# Array

# Algorithm
# init empty results array
# find all substrings within the array
# init variable named length to 3
# loop, that will find substrings of n length, beginning at 3
#   init start variable to 0
#   loop, finding the substrings of the length
#     retrieve substring
#     if the substr is same length of length, and is palindrome, append
#   increment length by 1
#   break when length == the size of the string
# with an array of all possible substrings within the array

# create a method that determines if a string is a palindrome
# palindrome is a 

require 'pry'

def palindrome?(str)
  str == str.reverse
end

def palindrome_substrings(str)
  results = []
  return results if str == ''
  length = 2
  loop do
    start = 0
    loop do
      substr = str[start, length]
      break if substr.length < length
      results << substr if palindrome?(substr)
      start += 1
    end
    length += 1
    break if length == str.length
  end
  results.sort
end

# Test cases:
p palindrome_substrings('connor') == ['nn', 'onno']
p palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
p palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome") == []
p palindrome_substrings("") == []