# Counting the Number of Characters
# Write a program that will ask a user for an input of a word or multiple words 
# and give back the number of characters. 
# Spaces should not be counted as a character.

# input:
# Please write word or multiple words: 
# walk
# output:
# There are 4 characters in "walk".
# input:

# Please write word or multiple words: walk, don't run
# output:

# There are 13 characters in "walk, don't run".

# - Input:
#   - String, user-inputted sentence
# - Output:
#   - String, describe the number of words in sentence
# - Rules:
#   - spaces don't count as a char
# - Data Structure:
#   - String, can easily gsub out the spaces and return the length
# - Abstraction:
# - Algorithm:
#   - gsub the spaces out of the string, replacing with nothing, then return the length
#   - print output to user

puts "Please write word or multiple words"
sentence = gets.chomp
count = sentence.gsub(' ', '').length
puts "There are #{count} characters in '#{sentence}'."