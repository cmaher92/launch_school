# Stringy Strings

# Write a method that takes one argument, a positive integer,
# and returns a string of alternating 1s and 0s, always starting with 1.
# The length of the string should match the given integer.

# input
  # integer; positive
# output
  # string; alternating 1s and 0s, always starting with 1, length matches
  # size of int

# create an empty array
# add '1's and '0's for the length of the inputted integer
  # if the array is empty, add a '1'
  # if the last item in the array is a '1', add a '0'
  # else, add a '1'
# combine the array into a single string using Enumerable#reduce

def stringy(int)
  ones_and_zeros = []
  int.times do
    if ones_and_zeros.empty?
      ones_and_zeros << '1'
    elsif ones_and_zeros[-1] == '1'
      ones_and_zeros << '0'
    else
      ones_and_zeros << '1'
    end
  end
  ones_and_zeros.reduce(:+)
end



# Examples:
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
# The tests above should print true.
