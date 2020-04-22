# 25.rb

# transform the given array into a hash of grouped values
# the key is the character and the value is an array of all characters
arr = ["a", "l", "p", "h", "a", "b", "e", "t", "s", "o", "u", "p"]

p arr.group_by { |letter| letter }

