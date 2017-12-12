=begin
Palindromic Substrings

Write a method that returns a list of all substrings of a string that are
palindromic. That is, each substring must consist of the same sequence of
characters forwards as it does backwards.
The return value should be arranged in the same sequence as the substrings
appear in the string. Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and
pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba"
nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

# given a string
# init a results arr
# find all the substrings
  # select all the substrings that match both forward and backwards
# return palindrome substrings

=end
require_relative 'all_substrings'

def palindromes(str)
  subs = substrings(str)
  palindromes = subs.select do |substr|
    substr == substr.reverse && substr.size > 1
  end
  palindromes
end

# Examples:
p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

=begin
Further Exploration

Can you modify this method (and/or its predecessors) to ignore non-alphanumeric
characters and case?

# remove non-alphanumeric characters from passed in string

=end
