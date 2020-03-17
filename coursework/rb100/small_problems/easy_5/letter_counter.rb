# Write a method that takes a string with one or more space separated words and
# returns a hash that shows the number of words of different sizes.
#
# Words consist of any string of characters that do not include a space.

# input
#   string of word
# output
#   hash each key representing length of word from inputted string
#        each value representing the number of words with that length
# rules/edge cases
#  when the string is empty return an empty hash

# create an empty hash, inititalize it with a default value of 0
# split the string and then iterate of each word within the string
#   access the newly created hash and increment value by 1

def word_sizes(str)
  word_counts = Hash.new(0)
  str.gsub(/[^a-zA-Z ]/, '').split.each { |word| word_counts[word.length] += 1 }
  word_counts
end

# Test Cases
puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}
