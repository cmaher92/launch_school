# Reverse It (Part 1)

# Write a method that takes one argument, a string, and returns the same
# string with the words in reverse order.

# input
  # string; sentence
# output
  # string; sentence, with words in reversed order

# split the sentence into an array of words
# reverse the array
# join the array with spaces
# return reversed sentence

def reverse_sentence(str)
  str.split(' ').reverse.join(' ')
end

# Test cases
puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
# The tests above should print true.
