# input
# two strings
# output
# string that is concatenated
# shorter string + longer string + shorter

# algorithm
# take the first string and see if it's longer than the second
# if it's longer concat the second + first + second
# otherwise concast the first, second, first

def short_long_short(string1, string2)
  if string1.length > string2.length
    string2 + string1 + string2
  else
    string1 + string2 + string1
  end
end

# test cases
puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
