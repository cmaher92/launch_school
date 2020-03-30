# Short Long Short
# Write a method that takes two strings as arguments, 
# determines the longest of the two strings, 
# and then returns the result of concatenating the shorter string, 
# the longer string, and the shorter string once again. 
# You may assume that the strings are of different lengths.

# input
#   2 Strings
# output
#   String, shorter string + longer string + shorter string
# data-structure
#   Array
# abstraction
#   - add both strings to array
#   - sort by length
#   - append string in 0 index to end of array
#   - join array

def short_long_short(s, s_2)
  s.length > s_2.length ? s_2 + s + s_2 : s + s_2 + s
end

# Examples:
p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"