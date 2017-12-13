=begin
input
string - s, that needs coding
int - shift, the number for the initial shift
output
arr - string split into fifths such that the first four arrays must try to be
equal length, and then the rest can go in the fifth array as long as it's
not longer than the first

init coded array
given the string, split into an array of chars
for each character in the array
  unless character is a space, then just append the space
  shift each character n number of times & append to coded
    increment shift by 1

now with an array of coded characters
join the array back

divide the string into five arrays
=end
def codeString(s, shift)
  coded = []
  # shift
  s.split(//).each do |char|
    if char == ' '
      coded << char
      shift += 1
      next
    end
    shift.times do
      char.next
    end
    coded << char
    shift += 1
  end
  p coded
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
