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
  - now that we have an array of values, map each value to the ALPHABET to get
    the now coded character


divide the string into five arrays
=end

ALPHABET = {
  a: 1,
  b: 2,
  c: 3,
  d: 4,
  e: 5,
  f: 6,
  g: 7,
  h: 8,
  i: 9,
  j: 10,
  k: 11,
  l: 12,
  m: 13,
  n: 14,
  o: 15,
  p: 16,
  q: 17,
  r: 18,
  s: 19,
  t: 20,
  u: 21,
  v: 22,
  w: 23,
  x: 24,
  y: 25,
  z: 26
}

def codeString(s, shift)
end

def movingShift(s, shift)
  coded_str = codeString(s, shift)
end

codeString('my name is connor', 2)

def demovingShift(arr, shift)
=begin
  input
    arr of coded strings
    the int shift
  output
    string decoded message
=end
end
