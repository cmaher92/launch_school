# reverse it

# Write a method that takes one argument, a string, and returns the same 
# string with the words in reverse order.

# understanding the problem
# input
#   string
# output
#   string - returns same string but the words are in reverse order

# algorithm
# create an array
# convert the string into an array
# loop until converted_array is empty
#     pop the last element off of the array and push it onto the new array
# return new array

# solution
def reverse_sentence(str)
    reversed = []
    str = str.split
    loop do
        reversed << str.pop
        break if str.empty?
    end
    reversed.join(' ')
end

# provided solution
def reverse_sentence(str)
    str.split.reverse.join(' ')
end

# test cases

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'