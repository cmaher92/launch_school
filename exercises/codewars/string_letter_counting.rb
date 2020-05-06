# String letter counting
# 6 Kyu

# Take an input string and return a string that is made up of 
# the number of occurances of each english letter in the input, 
# followed by that letter. The string shouldn't contain zeros; leave them out.

# An empty string, or one with no letters, should return an empty string.
# the input will always be valid;
# treat letters as case-insensitive

# input:
#   - String
# output:
#   - String; number of occurances of each english letter in the input
# constraints:
#   - don't count non alphabet characters
#   - empty string should return empty string
#   - input will always be valid
#   - treat letters as case-insensitive
# mental model:
#   - create a list of letters with their associated counts
#   - search given string, incrementing count for each letter
#   - filter only letters where their counts are above 0
#   - join into string
# algorithm/data structure:
#   - create hash where each key is an letter value is the count
#   - iterate over the downcased string, incrementing values of keys if key is present
#   - select only keys and values where values are > 0
#   - map hash to 'count' + 'value' -> array
#   - join array together

def string_letter_count(str)
  letters = ('a'..'z').to_a.map { |letter| [letter, 0] }.to_h
  str.downcase.each_char { |char| letters[char] += 1 if letters.has_key?(char) }
  letters.select { |_, value| value > 0 }.map { |letter, count| "#{count}#{letter}" }.join
end

# Examples
p string_letter_count("This is a test sentence.") =="1a1c4e1h2i2n4s4t"
p string_letter_count("") == ""
p string_letter_count("555") == ""
# ""                          ==>  ""
# "555"                       ==>  ""
