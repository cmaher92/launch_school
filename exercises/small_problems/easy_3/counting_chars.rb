# Counting the Number of Characters
#
# Write a program that will ask a user for an input of a word or multiple words
# and give back the number of characters. Spaces should not be counted as a
# character.

# get string form user represnting words or a sentence
# return integer representing number of chars
# don't count spaces

# get string from user
# calculate number of chars
#   remove spaces
#   count
#   set number_of_chars
# return integer

puts "Please write word or multiple words:"
user_input = gets.chomp
puts "There are #{user_input.delete(" ").length} characters in \"#{user_input}\""

# input: Please write word or multiple words: walk, don't run
# output: There are 13 characters in "walk, don't run".
