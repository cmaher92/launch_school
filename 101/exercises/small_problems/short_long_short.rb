# Short Long Short
#
# Write a method that takes two strings as arguments,
# determines the longest of the two strings, and then returns the result of
# concatenating the shorter string, the longer string, and the shorter string
# once again. You may assume that the strings are of different lengths.

# input
#   2, strings
# output
#   string

# given two strings, one longer than the other
# figure out which is shorter
#   - if the length of the first is less than the length of the second
#       first + second + first
#     else
#       second + first + second

# def short_long_short(first, second)
#   if first.length < second.length
#     first + second + first
#   else
#     second + first + second
#   end
# end

# implement with ternary operator
def short_long_short(first, second)
  first.length < second.length ?
  first + second + first :
  second + first + second
end

# Test cases
puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
