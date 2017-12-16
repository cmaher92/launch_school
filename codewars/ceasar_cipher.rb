=begin
input
string - s, that needs coding
int - shift, the number for the initial shift
output
arr - string split into fifths such that the first four arrays must try to be
equal length, and then the rest can go in the fifth array as long as it's
not longer than the first

init coded array
init a constant for the alphabet hash, the key's will be the letter values 1-26
  - given the string, split into an array of chars
  - now take all of the characters and map them to their associated letter_value
    using the ALPHABET hash, then take the value and add the shift, divmod and
    the remainder of the divmod should become the value
    - if the value is a ' ' make sure to set the value to 0
  - now that we have an array of values, map each value to the ALPHABET to get
    the now coded character
    - if the value is 0, set the character to a space
  - join the array of coded characters back together and return


divide the string into five arrays
=end
require 'pry'

ALPHABET = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

def code(word, shift)
  word_arr = word.chars
  count = shift

  word_arr.map! do |letter|
    ALPHABET.index(letter)
  end

  word_arr.map! do |value|
    if shift > 0
      value = (value + count) % 26
      count += 1
      value
    else
      value = (value + count) % 26
      count -= 1
      value
    end
  end

  word_arr.map! do |value|
    ALPHABET[value]
  end
  word_arr.join
end

def codeString(s, shift)
  # split the string into an array of words
  # code each word
  # join the array with spaces

  words = s.split(' ')
  words.map! do |word|
    # binding.pry
    code(word, shift)
  end
  p words.join(' ')
end

def decodeString(s, shift)
  words = s.split(' ')
  words.map! do |word|
    code(word, -shift)
  end
  p words.join(' ')
end
str = 'hello my name is connor'
shift = 9999999
coded_str = codeString(str, shift)
decodeString(coded_str, shift)
