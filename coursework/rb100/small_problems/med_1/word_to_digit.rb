# Word to Digit
# Write a method that takes a sentence string as input, and returns the same
# string with any sequence of the words
# 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'
# converted to a string of digits.

# given a string of words
# split the string into an arr
# map each word to the hash of numbers
# print out the sentence

require 'pry'

DIGIT_HASH = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}.freeze

def word_to_digit(words)
  DIGIT_HASH.keys.each do |word|
    words.gsub!(/\b#{word}\b/i, DIGIT_HASH[word])
  end
  words.gsub!(/(\d)(\s)/, '\1')
  words.gsub!(/(\d{3})(\d{4})/, '\1-\2')
  p words
end



# Further Exploration
# There are many ways to solve this problem and different varieties of it.
# Suppose, for instance, that we also want to replace uppercase and capitalized
# words.
# simply change the regex to match words regardless of their case
#
# Can you change your solution this so the spaces between consecutive numbers are
# removed? Suppse the string already contains two or more space separated numbers
# (not words); can you leave those spaces alone, while removing any spaces between
# numbers that you create?
#
# What about dealing with phone numbers? Is there any easy way to format the
# result to account for phone numbers? For our purposes, assume that any 10 digit
# number is a phone number, and that the proper format should be "(123) 456-7890".
# I can use gsub and do three capture groups, referencing each of them with formatting around it

# My solution
# Involves three functions
# Made harder by not just working with the string after
# reviewing Launch School's solution
# def map_numbers(str)
#   mapped_str = str.split(/(\s|\.)/).map do |word|
#     NUMBERS.keys.include?(word) ? NUMBERS[word].to_s : word
#   end
#   mapped_str
# end
#
# def join_arr(arr)
#   final_str = ''
#   arr.each do |str|
#     if str == '.'
#       final_str[-1] != ' ' ? final_str << str : final_str[-1] = str
#     elsif str == ' '
#       final_str << str unless final_str[-1] == ' '
#     else
#       final_str << str
#     end
#   end
#   final_str
# end
#
# def word_to_digit(str)
#   # map numbers in string
#   arr_of_words = map_numbers(str)
#
#   # join arr
#   final_str = join_arr(arr_of_words)
#
#   p final_str
# end

# Example:
p word_to_digit('Please call me at five five Five one two three four. Thanks.') == "Please call me at 555-1234. Thanks."
