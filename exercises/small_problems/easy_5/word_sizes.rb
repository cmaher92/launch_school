# letter counter

# Write a method that takes a string with one or more space separated words and returns a hash 
# that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

# input
# string
# output
# hash
# key, integer, letter counts of each word
# value, integer,  number of words with that letter count

# constraints
# words are any string of characters that do not include a space
# words with punctuation count as a single word
# empty string should return an empty hash

# initialize a hash with a 0 as the default value
# split the words on the spaces into an array
# iterate over the array
# for each iteration set the key as the word's count, and increment the value by one

def word_sizes(str)
  word_sizes = Hash.new(0)
  str.split(' ').each do |word| 
    word = word.gsub(/\W/, '')
    word_sizes[(word.size)] += 1 
  end
  word_sizes
end

# Test cases
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
