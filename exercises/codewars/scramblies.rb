# Scramblies (5 kyu)
=begin
Complete the function scramble(str1, str2) that returns true if a portion of str1 characters 
can be rearranged to match str2, otherwise returns false.

Notes:
Only lower case letters will be used (a-z). No punctuation or digits will be included.
Performance needs to be considered
Input strings s1 and s2 are null terminated.
Examples
scramble('rkqodlw', 'world') ==> True
scramble('cedewaraaossoqqyt', 'codewars') ==> True
scramble('katas', 'steak') ==> False
=end

# input:
#   - String - scrambled letters
#   - String - word
# output:
#   - boolean– whether or not str1 contains all the letters within it to make str2
# constraints:
#   - str1 must contain at the right number of characters to create the word
#   - strings will only contain lowercase letters
# test input/output
#   -
# algorithm/data structure:
#   - create a hash containing all letters and their counts from str1
#   - iterate over str2 checking the hash for the count for each character
#     - if retrieval of count returns nil or 0 return false
#     - subtract 1 from count for corresponding character
#   - return true

def scramble(str1, str2)
  counts = Hash.new(0)
  str1.each_char { |char| counts[char] += 1 }
  str2.each_char do |char|
    return false if counts[char] == nil || counts[char] == 0
    counts[char] -= 1
  end
  true
end

p scramble('rkqodlw', 'world')
p scramble('cedewaraaossoqqyt', 'codewars')
p scramble('katas', 'steak')
