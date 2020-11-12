# In this challenge, your task is to write a method which takes an array of strings 
# (containing secret enemy message bits!) and 
# decodes its elements using ROT13 cipher system; 
# returning an array containing the final messages.

str = "Why did the chicken cross the road?"
str2_encoded = "Gb trg gb gur bgure fvqr!"

str_encoded = "Jul qvq gur puvpxra pebff gur ebnq?"
str2 = "To get to the other side!"

def rot13(secret_messages)
  # iterate over the secret message
  # case letter is between 'a'..'m' || 'A'.."M"
    # - turn letter into it's ascii value
    # - add 13
  # else
  #   - subtract 13 from it's ascii value and convert back to char
  secret_messages.chars.map do |char|
    if char.between?('a', 'm') || char.between?('A', 'Z')
      (char.ord + 13).chr
    elsif char.between?('n', 'z') || char.between?('N', 'Z')
      (char.ord - 13).chr
    else
      char
    end
  end.join
end

p rot13(str_encoded)
p rot13(str2_encoded)