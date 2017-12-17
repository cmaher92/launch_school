=begin
Capitalize Words

Write a method that takes a single String argument and returns a new string 
that contains the original value of the argument with the first character of 
every word capitalized and all other letters lowercase.

You may assume that words are any sequence of non-blank characters.
=end

# input
#   string
# output
#   string, capitalize all words in string 

# given the string
# break it up into an array
# for each word in the array, capitalize
# join the string with spaces
# return

# My solution
# def word_cap(str)
#   p str.split.map(&:capitalize).join(' ')
# end

# Further exploration
# come up with a solution not using capitalize

# map each word in the arr
#   access the 1st element in the word
#   change it to a capital version
#   change remaining string to lowercase

# def word_cap(str)
#   arr   = str.split
#   count = 0
#   loop do
#     break if count == arr.length
#     arr[count][0] = arr[count][0].upcase
#     arr[count][1..-1] = arr[count][1..-1].downcase
#     count += 1
#   end
#   arr.join(' ')
# end

# another solution
# given a string
# split into an array on the spaces
# use regex to change each lowercase first character in each word to uppercase
# use regex to change the remaining characters in the word to lowercase
require 'pry'

def word_cap(str)
  arr    = str.split
  result = []
  arr.each do |word|
    word = word.gsub(/(.)/, &:upcase)
    word = word.gsub(/.{1}(.*)$/, &:downcase)
    binding.pry
    result << word
  end
  p result.join(' ')
end
  

# Test Cases
p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

=begin
Solution

def word_cap(words)
  words_array = words.split.map do |word|
    word.capitalize
  end
  words_array.join(' ')
end
We can also write this more succinctly as:

def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end

Discussion
In the second solution, (&:method_name) is shorthand notation for 
{ |item| item.method_name }. Thus, &:capitalize translates to:

do |word|
  word.capitalize
end

We can use this shorthand syntax with any method that has no required arguments.

Further Exploration

Ruby convenient provides the String#capitalize method to capitalize strings. 
Without that method, how would you solve this problem? Try to come up with at 
least two solutions.
=end