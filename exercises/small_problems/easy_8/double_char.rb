# double_char.rb
# easy_8
# problem_6

# input: string
# output: string with every character repeated

def double_consonants(str)
  str.split(//).map { |chr| chr.match?(/[^aeiou\d\W]/i) ? chr + chr : chr }.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""