# consonant value
# https://www.codewars.com/kata/59c633e7dcc4053512000073

require 'pry'

# input
#   string; lowercase, alphabetic chars only, no spaces
# output
#   int; the highest value substring
# rules
#   consonants are any letters of the alphabet except 'aeiou'

# split the given str on any vowels

def solve(str)
  str.split(/[aeiou]/).map! do |substring|
    substring.bytes.map { |value| value - 96 }.reduce(&:+)
  end.reject { |value| value == nil }.max
end

puts solve("zodiac") == 26
puts solve("chruschtschov") == 80
puts solve("khrushchev") == 38
puts solve("strength") == 57
puts solve("catchphrase") == 73
puts solve("twelfthstreet") == 103
puts solve("mischtschenkoana") == 80
