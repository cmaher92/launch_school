# Reverse It (Part 2)

# Write a method that takes one argument, a string containing one or more words,
# and returns the given string with all five or more letter words reversed.
# Each string will consist of only letters and spaces. Spaces should be
# included only when more than one word is present.

# input
  # string; containing one or more words
# output
  # string; any words in the sentence with five or more letters are reversed

# split the sentence into an array, spaces being the delimiter
# map the array, if the item in the array is five or more letters long, reverse
# join with spaces

def reverse_words(str)
  str.split(' ').map { |word| word.length >= 5 ? word.reverse : word }.join(' ')
end

# Examples:
puts reverse_words('Professional')           == 'lanoisseforP'
puts reverse_words('Walk around the block')  == 'Walk dnuora the kcolb'
puts reverse_words('Launch School')          == 'hcnuaL loohcS'
