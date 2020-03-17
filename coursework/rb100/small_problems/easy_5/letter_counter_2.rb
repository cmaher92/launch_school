# Letter Counter (Part 2)

# Modify the word_sizes method from the previous exercise to exclude non-letters 
# when determining word size. For instance, the length of "it's" is 3, not 4.

require_relative 'letter_counter'
require 'pry'

# given a string with both non-alphabetic chars and alphabetic chars
# remove the non-alphabetic chars and replace with nothing
# then call the previous function

def word_sizes_2(sentence)
  sentence.tr!('^a-zA-Z ', '')
  # binding.pry
  word_sizes(sentence)
end

# Test cases
puts word_sizes_2('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes_2('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes_2("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes_2('') == {}
