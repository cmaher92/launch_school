# What is an anagram? 
# Well, two words are anagrams of each other if they both contain the same letters. 

# For example:
# 'abba' & 'baab' == true
# 'abba' & 'bbaa' == true
# 'abba' & 'abbba' == false
# 'abba' & 'abca' == false

# Write a function that will find all the anagrams of a word from a list. 
# You will be given two inputs a word and an array with words. 
# You should return an array of all the anagrams or an empty array if there are none. 

# input:
#   - string: word
#   - array of strings: words
# output:
#   - array of words that are anagrams
# constraints:
#   - two words are anagrams if they both contain the same letters
#   - return empty array of there are no anagrams
# mental model:
#   - check each word in the list to see if it is an anagram of the inputted word
#     - rearrange characters so they are ordered alphabetically
#     - compare with word so that word's characters are rearranged as well
#     - if they are the same add to result array
# algorithm/data structure:
#   - sorted_word = word where characters are sorted alphabetically
#   - select list of words
#     - rearrange word alphabetically, then compare to sorted_word
require 'benchmark'


def anagrams(word, words)
  word = word.chars.sort
  words.select { |w| w.chars.sort == word }
end

word  = 'abba'
words = ['aabb', 'abcd', 'bbaa', 'dada']
Benchmark.bm do |x|
  x.report  { anagrams(word, words) }
  x.report  { anagramz(word, words) }
end
# p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) #=> ['aabb', 'bbaa']
# p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) #=> ['carer', 'racer']
# p anagrams('laser', ['lazing', 'lazy',  'lacer']) #=> []
