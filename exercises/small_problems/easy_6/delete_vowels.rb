=begin
Delete vowels

Write a method that takes an array of strings, and returns an array of the
same string values, except with the vowels (a, e, i, o, u) removed.

input
  array of strings
output
  array of strings with the vowels removed

  given the array of strings
  map each string in the array
    gsub the string to replace with nothing
  return the array
=end

def remove_vowels(arr)
  arr.map { |str| str.gsub(/[aeiouAEIOU]/, '') }
end
p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
