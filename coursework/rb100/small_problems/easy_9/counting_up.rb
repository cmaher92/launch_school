# Counting Up
# Write a method that takes an integer argument,
# and returns an Array of all integers, in sequence, between 1 and the argument.
#
# You may assume that the argument will always be a valid integer
# that is greater than 0.

# input
#   int
# output
#   array of all integers up to given number

# given a number
# create an array that is from 1 to the number

def sequence(num)
  Array.new(num) { |i| i+1 }
end

# Further Exploration
# Food for thought: what do you think sequence should return
# if the argument is not greater than 0
# For instance, what should you do if the argument is -1?
# Can you alter your method to handle this case?

def sequence(num)
  return [] if num < 1
  (1..num).to_a
end

# Examples:
p sequence(-1) == []
p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
