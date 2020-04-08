# letter swap

# input
# string, of words
# output
# string, of words where the first and last letter are reversed

# constraints
# words contain at least 1 letter
# string will always contain at least one word
# each string contains nothing but words and spaces

# split string on spaces
# map the array, switching the first letter of the word with the last
  # take the first letter, the last letter, and the letters in between and concatenate
# join the array, with spaces as delimiters

def swap(str)
  str.split(' ').map do |word|
    # a, b = b, a
    word[0], word[-1] = word[-1], word[0]
    word
  end.join(' ')
end


p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'