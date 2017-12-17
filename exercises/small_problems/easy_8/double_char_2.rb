=begin
Double Char (Part 2)

Write a method that takes a string, and returns a new string in which every 
consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, 
and whitespace should not be doubled.

input
  str
output
  str, where every consonant character is doubled, everything else is not
  
init a constant holding an array of consonants

given a string
split the string into character and iterate over each character
for each character
  check to see if it's a consonant, if it is add it twice to the results arr
  if it isn't just add it once to the results arr
join
return

=end

CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(str)
  results = ""
  str.each_char do |char|
    CONSONANTS.include?(char.downcase) ? results << char << char : results << char
  end
  results
end



# Examples:
p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""