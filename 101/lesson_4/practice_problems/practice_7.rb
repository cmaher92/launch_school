# Create a hash that expresses the frequency with which each letter
# occurs in this string:

statement = "The Flintstones Rock"
letters = Hash.new(0)
statement.downcase.chars.each do |char|
  letters[char] += 1
end
p letters
