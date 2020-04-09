# clean up the words

# given a string that consists of some words (all lowercased)
# and an assortment of non-alphabetic characters
# write a method that returns that string
# with all the non-alphabetic characters replaced by spaces
# if one or more non-alphabetic characters occur in a row
# you should only have one space in the result

# input
# string, with alphabetic and non-alphabetic characters
# output
# string, with all substrings of non-alphabetic characters replaced with a space

# constraints
# only one space to replace a series of non-alphabetic characters
# never should have consecutive spaces
# all lowercased

# approach
# gsub the string
# the pattern should match all non-alphabetic characters in a row
# /\W+/ replaced with ' '

# original solution
# def cleanup(str)
#   str.gsub(/\W+/, ' ')
# end

# without regular expressions
# initialize a constant for a-z, all lowercased

# method, cleanup
# init a string that will hold the result
# split the string, iterating over it
  # if the character is within the constant, push to array
  # if the character isn't, push a space, unless the previous character is a space
# return the result
require 'pry'

ALPHABET = ('a'..'z').to_a

def cleanup(str)
  result = ''
  str.split('').each do |char|
    ALPHABET.include?(char) ? result << char : (result << ' ' unless result[-1] == ' ')
  end
  result
end

p cleanup("---what's my +*& line?") == ' what s my line '
