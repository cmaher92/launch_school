# Letter Counter (Part 1)

# Write a method that takes a string with one or more space separated words 
# and returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

# input
#   string, a sentence with a single spaced out words
# output 
#   hash, the key represents number of chars in a word and the value is number of
#   words found with that many chars

# given a sentence
# create an empty hash for word_size
# split the words in an array of words
# for each word in the array 
#   count the chars and check if there is a key match for that size, 
#   if there is increment the value
#   otherwise add it to the hash
# return the hash

def word_sizes(sentence)
  word_size = {}
  arr = sentence.split(' ')
  arr.each do |word|
    if word_size.has_key?(word.size)
      word_size[word.size] += 1
    else 
      word_size[word.size] = 1
    end
  end
  word_size
end

# Test Cases
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('') == {}
