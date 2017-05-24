# reverse it part 2

require 'pry'

# Write a method that takes one argument, a string containing one or more words, 
# and returns the given string with all five or more letter words reversed. 
# Each string will consist of only letters and spaces. Spaces should be 
# included only when more than one word is present.

# understanding the problem
# input
#     string - containing one or more words
# output
#     string - with all five or more letter words reversed
# rules
#     spaces should only be included when there is more than 1 word
#     each string will only consist of letters and spaces

# algorithm
# take the string and convert to an array
# take the array and map it
    # if element.length > 5 reverse it
    # else don't
# join the array(' ')

# solution
def reverse_words(str)
    str = str.split
    str.map! do |word|
        if word.length > 5
            word.reverse.tr("!@#$%^&*()_+-=<,>.:;'{[]}`~1234567890", "")
        else
            word.tr("!@#$%^&*()_+-=<,>.:;'{[]}`~1234567890", "")
        end
    end
    str.join(' ')
end

# test cases
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
puts reverse_words('Professional    ')      # => lanoisseforP
puts reverse_words('Professional!!!!!!!!')  # => lanoisseforP