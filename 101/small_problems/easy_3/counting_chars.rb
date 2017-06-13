# Counting the Number of Characters

# Write a program that will ask a user for an input of a word or multiple words 
# and give back the number of characters. Spaces should not be counted as a 
# character.

# understanding
# input
#   string
# output
#   print the number of characters in the provided string

# algorithm
# strip the string of spaces
#   string.gsub(//, "")
# calculate number of chars
# print out results

puts "Please write word or multiple words:"
str = gets.chomp

stripped_str = str.gsub(/ /, "")

puts "There are #{stripped_str.length} characters in \"#{str}\"."

