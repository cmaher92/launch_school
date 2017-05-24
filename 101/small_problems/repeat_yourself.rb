# repeat_yourself

# Write a method that takes two arguments
# a string and a positive integer
# prints the string as many times as the integer indicates

# Understanding the problem
# Input
#   a string
#   positive integer
# Output
#   string printed as many times as the integer indicates

# Algorithm
# Call the times method from the integer
#   for each block print the string

# Solution
def repeat(str, num)
  num.times { puts str }
end

# Examples / Test Cases
# Ask the interviewer how to handle when the input doesn't match the 
# input description.
repeat('Hello', 3)
repeat('Testing', 100)
# repeat(1, 100)