# leading_substrings.rb
# easy_8
# problem_3

# input: string
# output: array of strings
# rules:
#   - substr should be from start of array to current index
#   - easiest to convert string to array
#     - iterate over the newly converted array mapping each element's value to the substr
#     - use #with_index to retrieve the substring

def substrings_at_start(str)
  str.split(//).map.with_index { |_, idx| str[0..idx] }
end

# p substrings_at_start('abc') #== ['a', 'ab', 'abc']
# substrings_at_start('a') #== ['a']
# substrings_at_start('xyzzy') #== ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']