# sum of digits

# Write a method that takes one argument, a positive integer,
# and returns the sum of its digits

# understanding the problem
# input
#   positive integer
# output
#   integer - sum of the inputs digits

# algorithm
    # take a number, make it a string, split it
    # take the newly created array and map it to digits
    # reduce the array
    
# solution
    def sum(num)
        num.to_s.chars.map(&:to_i).reduce(:+)
        # array_of_ints.reduce(:+)
    end
# test cases
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45