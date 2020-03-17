=begin
The End Is Near But Not Here

Write a method that returns the next to last word in the String 
passed to it as an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at least two words.

input
  string of words
output
  string, second to last word in the string
  
given a str, convert to arr of words, return word in the -1 index pos
=end

# def penultimate(str)
#   str.split.fetch(-2)
# end

=begin
Further Exploration

Write a method that returns the middle word of a phrase/sentence

input
  string of words
output
  string, middle word
rules
  need to handle just a single word
  string that contains no word
  
given a string
if the string is empty, return an empty string
split the string into words
middle = size of the arr / 2
fetch the middle element from the arr
=end

def penultimate(str)
  return '' if str == ''
  words = str.split # words [last word]
  middle = words.size / 2 # middle is 1
  words.fetch(middle) 
end


# Test cases
p penultimate('last word') == 'word'
p penultimate('Launch School is great!') == 'is'
p penultimate('') == ''
p penultimate('how are you') == 'are'
p penultimate('connor') == 'connor'