# center_of.rb
# easy_8
# problem_10

# input: string
# output: string
# rules:
#   - takes a non-empty string argument and returns the middle character of characters
#   - if it's an odd length, return the exact middle character
#   - if it's even length, return two middle characters

# find the middle
#   - divide the length of the string by 2.0 and return the #floor
# return character(s)
#   - if the length is odd, return the middle character
#   - if the length is even, return the middle character and another

def center_of(str)
  middle = (str.length / 2)
  str.length.odd? ? str[middle] : str[(middle - 1), 2]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'