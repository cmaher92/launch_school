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

ALPHABET = {
  ' ' => 0,
  'a' => 1,
  'b' => 2,
  'c' => 3,
  'd' => 4,
  'e' => 5,
  'f' => 6,
  'g' => 7,
  'h' => 8,
  'i' => 9,
  'j' => 10,
  'k' => 11,
  'l' => 12,
  'm' => 13,
  'n' => 14,
  'o' => 15,
  'p' => 16,
  'q' => 17,
  'r' => 18,
  's' => 19,
  't' => 20,
  'u' => 21,
  'v' => 22,
  'w' => 23,
  'x' => 24,
  'y' => 25,
  'z' => 26
}

def codeString(s, shift)
  s = s.split(//)
  counter = shift
  coded = []

  s.map! do |char|
    ALPHABET[char]
  end

  s.each do |num|
    # handles not shifting for spaces
    if num == 0
      coded << num
      counter += 1
      next
    end
    coded << num += counter
    counter += 1
  end

  coded.map! do |num|
    _, r = num.divmod(26)
    ALPHABET.key(r)
  end
  coded.join
end

def movingShift(s, shift)
  coded_str = codeString(s, shift)
  coded_strs = []
  q, r = coded_str.size.divmod(4)

  counter = 0
  5.times do
    coded_strs << coded_str.slice(counter, q)
    counter += q
  end

  p coded_strs
end

movingShift('my name is connor', 2)

def demovingShift(arr, shift)
=begin
  input
    arr of coded strings
    the int shift
  output
    string decoded message
=end
end
