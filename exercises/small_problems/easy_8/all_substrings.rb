# all_substrings.rb
# easy_8
# problem_4

require_relative 'leading_substrings'

# input: string
# output: array of all possible sequential substrings

# algorithm:
#   split string, returning an array
#   iterate over array of characters mapping each character
#     - pass from 0..current_index into #substrings_at_start which will return an array
#   flatten array of arrays and return

def substrings(str)
  str.split(//).map.with_index { |_, idx| substrings_at_start(str[idx..-1]) }.flatten
end

# p substrings('abcde')