# Longest sentence

# Write a program that reads the content of a text file and then prints the
# longest sentence in the file based on number of words. Sentences may end with
# periods ( . ), exclamation points ( ! ), or question marks ( ? ). Any
# sequence of characters that are not spaces or sentence-ending characters
# should be treated as a word. You should also print the number of words in
# the longest sentence.

# input
#   text file
# output
#   string, longest sentence read in from the text File
#   integer, the number of words in the longest sentence
# rules
#   - sentences may end with periods, exclamation points, or question marks
#   - any sequence of chars that are not spaces or sentence-ending characters
#   should be treated a word

# - read the file in using read
# - remove the \n characters from the string
# - split the sentences based on sentence ending punctuation ( , . ? )
# - split each sentence into words, any sequence of characters that are not
# delineated by spaces or sentence ending punctuation should be considered
# words.
# - sort each array of arrays by the inner-arrays count
# - return the last element in the sorted array with the count

content = File.read('frankenstein.txt')
sentences = content.gsub(/[\n]/, ' ').split(/[.?!]/)
sentences.map! do |sentence|
  sentence.split(/\s+/)
  # p sentence
end
sentences.map! do |sentence|
  sentence.select do |word|
    word != ''
  end
end

# sentences.each do |sentence|
#   p sentence
#   p sentence.length
# end
sentences_sorted = sentences.sort_by { |arr| arr.size }
p sentences_sorted[-1].size
