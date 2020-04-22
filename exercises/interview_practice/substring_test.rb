# Given 2 strings, your job is to find out if there is a substring
# that appears in both strings. You will return true if you find a
# substring that appears in both strings, or false if you do not.
# We only care about substrings that are longer than one letter long.

# input
#   2 strings
# output
#   boolean - whether or not there is a substring in both strings



# given two strings
#   find all the substrings for the first string place in array
#     grab the first character of the word
  #     grab the second character of the word
  #     grab the third character of the word
  #     grab the fourth ...
#   find all of the substrings for the second string place in array
#  now iterate over the first array of substrings and check
#    to see if any of the substrings are in the second set of substrings
require 'pry'
def find_substrings(str)
  letters = str.downcase
  substrings = []
  0.upto(letters.length - 2) do |first|
    1.upto(letters.length - 1) do |last|
      substrings << letters[first..last] unless last <= first
    end
  end
  substrings
end

def substring_test(str, str2)
  subs =  find_substrings(str)
  subs.any? do |sub|
    str2.include?(sub)
  end
end

# find_substrings('connor')
p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
