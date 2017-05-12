# Write a method that takes a string argument and returns a new string
# that contains the value of the original string with all consecutive duplicate
# characters collapsed into a single character.


# crunch(string)
# Split the string into an array
# uniq on the array
# return the result
# returns string

def crunch(string)
  array = string.split('')
  word = ''
  # given the array iterate through each character
  # for each character
end

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''
