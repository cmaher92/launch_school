# palindromes.rb
# easy_8
# problem_5

# input: string
# output: array of substrings
# rules:
#   - returns a list of all substrings of a string that are palindromic
#   - single characters are not palindromic
#   - case matters

# algorithm:
#   find all substrings of str
#   select all substrings that are palindromic
#     - same forwards as backwards
#     - simple reverse the string, then compare both

require_relative 'all_substrings'

def palindromes(str)
  substrings = substrings(str).select { |s| s.length >= 2 && s == s.reverse }
end

p palindromes('abcd')
p palindromes('madam')
p palindromes('hello-madam-did-madam-goodbye')