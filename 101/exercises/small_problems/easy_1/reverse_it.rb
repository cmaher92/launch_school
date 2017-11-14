# Reverse It (Part 1)

# Write a method that takes one argument, a string, and returns the same
# string with the words in reverse order.

# given a string representing a sentence
# reverse the order of the words
#   - string.split().reverse.join()

# START
# 
# END

def reverse_sentence(string)
    string.split().reverse.join(' ')
end

# Test cases
puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
# The tests above should print true.
