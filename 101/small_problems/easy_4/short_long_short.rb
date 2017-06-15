# short long short

# Write a method that takes two strings as arguments, determines the longest
# of the two strings, and then returns the result of concatenating the shorter
# string, the longer string, and the shorter string once again. You may assume
# that the strings are of different lengths.

# understanding
# input
#   string
#   string
# output
#   concatenated string

# algorithm
# determine shortest string
# concatentate shortest string + longest string + shortest string

# def short_long_short(str1, str2)
#     if str1.length > str2.length
#       longest = str1
#       shortest = str2
#     else
#       longest = str2
#       shortest = str1
#     end
#     shortest + longest + shortest
# end

# given solution
def short_long_short(string1, string2)
  if string1.length > string2.length
    string2 + string1 + string2
  else
    string1 + string2 + string1
  end
end

# problem set
puts "pass" if short_long_short('abc', 'defgh') == "abcdefghabc"
puts "pass" if short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts "pass" if short_long_short('', 'xyz') == "xyz"
