# Write a method that takes a string as an argument and returns the character that occurs most often in the given string. If there are multiple characters with the equal highest number of occurrences, then return the one that appears first in the string. When counting characters, consider the uppercase and lowercase version to be the same.

# input:
#   - string
# output:
#   - string, single character that appears most
#     - if there is two that appear equal amount of times, return one that appears     #       first
# rules/constraints:
#   - case insensitive
# test input/output
#   - 
# algorithm/data structure:
#   - create an empty hash for storing letters and their counts, default value is 0
#   - downcase the string
#   - iterate over the string, character by character
#     - add letter and increment count
#   - find out what the highest count is
#     - retrieve the values from hash, then retrieve the max value from values array
#   - select pairs where v is max_value from hash
#   - if only 1, return the key
#   - if more than 1
#     - retrieve keys
#     - iterate over string, return key that appears first

def most_common_char(str)
  counts = Hash.new(0)
  str = str.downcase

  str.each_char { |char| counts[char] += 1 }
  
  highest = counts.values.max
  counts = counts.select { |k, v| v == highest }

  if counts.size == 1
    counts.keys.first
  else
    str.each_char { |char| return char if counts.keys.include?(char) }
  end
end

# Examples:
p most_common_char("Hello World") == "l"
p most_common_char("Peter Piper picked a peck of pickled peppers") == "p"
p most_common_char("Mississippi") == "i"
p most_common_char("Happy birthday!!!") == '!'

# The tests above should print "true".
