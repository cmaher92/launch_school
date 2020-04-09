# alphabetical numbers

# Write a method that takes an Array of Integers between 0 and 19, 
# and returns an Array of those Integers 
# sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, 
# twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

# input
# array of numbers 0-19
# output
# array of numbers sorted based on their english words representing each number

# initialize a constant that points to an array of english words representing numbers

# given an array of integers
# map over the array
#   return the english number for that number
#   use the number as the index, retrieving from the constant NUMBERS
# sort
# map the array again
# the return value should be the index of the word
# NUMBERS.index(english_word)
# return

NUMBERS = %w(zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, 
twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen)

def alphabetic_number_sort(numbers)
  words = numbers.map { |number| NUMBERS[number] }
  sorted_numbers = words.sort.map { |word| NUMBERS.index(word) }
end

# test cases
p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]