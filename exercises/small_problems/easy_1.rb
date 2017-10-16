# easy_1

# Write a method that takes two arguments
# a string and a positive integer
# and prints the string as many times as the integer indicates

# Understanding the problem
  # What happens when the int isn't positive
  # What happens when a string isn't passed into the func

# Input/Output
# Input
  # String, Int
# Output
  # Prints the string

# Algorithm
# if the int is greater than 0
  # times the int and for each block print the string

def repeat_yourself(str, int)
  if int > 0
    int.times { puts str }
  end
end

# Test Cases
repeat_yourself('hello', 3)      # => 'hello' 'hello' 'hello'
repeat_yourself('hello', -1)     # =>

# Add 35 mins to time tracker
