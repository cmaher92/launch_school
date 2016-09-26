# capitalize.rb
# Write a method that takes a string as argument
# The method should return all-caps version of the string
# but only if the string is longer than 10 chars

def capitalize(string)
  string.upcase if string.length > 10
end

puts capitalize("hey how are you?")
