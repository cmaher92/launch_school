# reverse it
# part 2

# input
# string
#   can contain letters and spaces
# output
# string, but reversed if the length is >= 5

def reverse_words(str)
  str.gsub(/\w{5,}/) { |word| word.reverse }
end

p reverse_words('Professional')
p reverse_words('Walk around the block')
p reverse_words('four')