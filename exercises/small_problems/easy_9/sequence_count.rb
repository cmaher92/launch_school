# Sequence Count

# Create a method that takes two integers as arguments. 
# The first argument is a count, and the second is the first number of a 
# sequence that your method will create. 
# The method should return an Array that contains the same number of elements as 
# the count argument, while the values of each element will be multiples of the 
# starting number.

# You may assume that the count argument will always have a value of 0 or greater,
# while the starting number can be any integer value. If the count is 0, an empty 
# list should be returned.

# input
#   2 integers (count, start_num)
# output
#   Array, same number of elements that will be multiples of start_num
# rules
#   count will always be 0 or greater
#   start_num can be any integer value
#   if count is 0, return an empty list

# init an array for the multiples
# given the count
# append the multiples of the start_num to the array the number of times
# defined by the count
# return the array

# def sequence(count, start_num)
#   multiples = []
#   count.times do |multiplier|
#     multiples << start_num * (multiplier + 1)
#   end
#   p multiples
# end

# LS solution
# This is a unique solution because they use a Range between
# 1 and the count passed in as the collection and then map over the range
# which returns an array
# what does map return for each collection type?
def sequence(count, first)
  (1..count).map { |idx| idx * first }
end

# Examples:
p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []