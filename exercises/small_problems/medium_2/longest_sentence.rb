# Longest Sentence
# Medium 2, problem 1

# Write a program that reads the content of a text file 
# and then prints the longest sentence in the file based on number of words. 
# Sentences may end with periods (.), exclamation points (!), or question marks (?). 
# Any sequence of characters that are not spaces or sentence-ending characters 
# should be treated as a word. 
# You should also print the number of words in the longest sentence.

# < contents of a text file
# > outputs the longest sentence of file
# ! sentence length based on words
# ! sentences may end with periods, exclamation points, or question marks
# ! word characters are everything but spaces and sentence ending characters
# ! print number of words in sentence
# &
# read contents of text file
#   - read file File.read('test.txt')
# split text on word ending characters -> sentences
#   - map each sentence from a string to an array of words
#     - 
# output number of words in sentence, along with the longest sentence

text_file = File.read('test.txt').gsub(/\n/, ' ')
sentences = text_file.split(/[\.\!\?]/)
sentences = sentences.map { |sentence| sentence.split.join(' ') }.sort_by { |sentence| sentence.split.count }
longest_sentence, longest_sentence_word_count = sentences[-1], sentences[-1].split.size
p "The longest sentence is '#{longest_sentence}'."
p "The longest sentence was #{longest_sentence_word_count} words."