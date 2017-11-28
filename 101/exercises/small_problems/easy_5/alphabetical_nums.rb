# Alphabetical Numbers

# Write a method that takes an Array of Integers between 0 and 19, and returns 
# an Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, 
# twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

# input
#   Array of integer between 0 and 19
# output
#   Integer, sorted based on the english word for each number


def alphabetic_number_sort(arr)
  num_converter = {
0 => 'zero',
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four', 
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine',
  10 => 'ten',
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => 'fourteen',
  15 => 'fifteen',
  16 => 'sixteen',
  17 => 'seventeen',
  18 => 'eighteen',
  19 => 'nineteen'
}
  # sort the array
  # map each number in the array
  arr.sort.map! { |num| num_converter[num] }
  # flip the hash
  num_converter = num_converter.each_pair { |key, value| key, value = value, key }
  puts num_converter.inspect
  # map the harr again
  # return arr
end

# Test Cases
puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
