# penultimate
# easy_7
# problem_10

# input: string
# output: string
# rules:
#   - returns second to last word
#   - assume input string will always contain at least two words
#   - words are defined as any sequence of non-blank characters

# algorithm:
#   - split the str into words
#   - return second to last word in array

# def penultimate(str)
#   str.split[-2]
# end

# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'

# middle_phrase
# input: string
# output: string
# rules:
#   - if str is empty, return empty str
#   - if str has even number of words, what is considered the middle word?
#     - divide by a float, then choose #ceil
#     - make it easier to change the middle word to the floor if necessary
#   - if it's one word, return that word

require 'pry'

def middle_word(phrase)
  return phrase if phrase.empty? || phrase.split.size == 1
  phrase = phrase.split
  middle = (phrase.size / 2)
  phrase[middle]
end

p middle_word('undefined local variable or method')
p middle_word('hi how are you')