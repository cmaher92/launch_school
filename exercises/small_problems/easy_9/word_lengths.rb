# word lengths
# easy 9, problem 6

# < String
# > Array of Strings
# ! Each String in the Array contains the original string, a space, and the length of the string
# &
# split the string, mapping over the return value
# within the block
#   - return string + " " + string.length
# return result from map

def word_lengths(sentence)
  sentence.split.map { |str| "#{str} #{str.length}" }
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []