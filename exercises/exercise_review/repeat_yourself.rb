# Repeat Yourself

# Write a method that takes two arguments, a string and a positive integer,
# and prints the string as many times as the integer indicates.

# input
  # string
  # integer; positive
# output
  # String printed number of times integer indicates

def repeat(str, num)
  num.times { puts str }
end

# Test cases
repeat('Hello', 3)

# Expected output
# Hello
# Hello
# Hello
