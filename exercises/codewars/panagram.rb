# panagram
# sentence that contains every single letter of the alphabet
# at least once

# input
#   string
# output
#   true or false

# create a string of the alphabet
# for each character in the inputted string
#   check if it is contained in the alphabet string
#   if it is, remove it
#   otherwise continue
#   if the string at the end is empty return true
#   otherwise return false

def panagram?(string)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  string = string.gsub(/[^A-Za-z]/, "")
  string.each_char do |chr|
    alphabet.gsub!(chr, "")
  end
  alphabet == ""
end

p panagram?('The quick brown fox jumps over the lazy dog.') == true
