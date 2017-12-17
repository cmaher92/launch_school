# Letter Swap
#
# Given a string of words separated by spaces, write a method that takes this
# string of words and returns a string in which the first and last letters of
# every word is swapped.
#
# You may assume that every word contains at least one letter, and that the
# string will always contain at least one word.
# You may also assume that each string contains nothing but words and spaces
# input
#   string of words seperate by spaces
# output
#   string in which the first and last letters of each word is swapped
# rules
#   every word inputted will contain at least one letter
#   string will always contain at least one word

# given a string
# split the string into an array
# for each item in the array
#   swap the first and last character of the string
# combine the array and add a space between each item
# return string

def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(string)
  arr = string.split(' ')
  arr.map! { |word| swap_first_last_characters(word) }
  arr.join(' ')
end

#
# Examples:
puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'

# Further exploration
# How come our solution passes word into the swap_first_last_characters method
# invocation instead of just passing the characters that needed to be swapped?

# The reason for doing it this way was that the map function applies what
# the block returns to each element, if it was done the other way it would
# only return the first and last letter, therefor the way mentioned would not
# work
