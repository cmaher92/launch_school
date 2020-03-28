# reverse it
# part 1

# input
# string
# output
# new string with words in reverse order
# rules
# empty string returns empty string
# maintain case

# given a string
# scan, using space as the delimeter
# reverse the result and return

def reverse_sentence(str)
  str.scan(/\w+/).reverse.join(' ')
end

p reverse_sentence('') == ''
p reverse_sentence('Hello World') == 'World Hello'
p reverse_sentence('Reverse these words') == 'words these Reverse'