# daily double

# write a method that takes a string argument
# returns a new string that contains the value of the original string
# with all consecutive duplicate characters collapsed into a single character

# input
# string

# output
# string, original string with all consecutive duplicate characters collapsed into single char

# contraints
# can't use String#squeeze

# init a result string
# split into array of characters
# append the character to string if the previous character isn't the same
# join and return

# def crunch(str)
#   result = ''
#   str.split('').each { |char| result[-1] == char ? next : (result << char) }
#   result
# end

def crunch(str)
  str.gsub(/(\w)\1+/) { |match| match[0] }
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''