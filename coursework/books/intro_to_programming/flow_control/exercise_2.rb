# Exercise 2
# Ruby methods
#
# Write a method that takes a string as an arg
# The method should return the all-caps version of string
# but only if the string is longer than 10 characters

def caps_if_string_longer_than_10_chars string
  if string.length > 10
    string.upcase
  else
    string
  end
end

puts caps_if_string_longer_than_10_chars 'dogfisherman'
