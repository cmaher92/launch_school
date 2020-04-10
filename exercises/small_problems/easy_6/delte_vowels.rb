# delete vowels

# input: array of strings
# output: array, with the same strings except the vowels removed
# rules:
#   explicit:
#     - all vowels are removed
#   implicit:
#     - case insensitive, if it's a vowel it's removed regardless
#     - if the string becomes empty, return it anyways
#     - not mutating

# data-structure: array

# algorithm
# map the string
# remove vowels
#   - gsub vowels regardless of case, replace with nothing
# return mapped array

def remove_vowels(strings)
  strings.map { |str| str.gsub(/[aeiou]/i, '')}
end

# test cases
p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']