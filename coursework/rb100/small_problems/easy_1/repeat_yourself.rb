# Repeat Yourself

# Write a method that takes two arguments, a string and a positive integer,
# and prints the string as many times as the integer indicates.

# Given a string and a number
# print the string as many times as the number

# START
#
# 5.times PRINT string
#
# END

def repeat(string, int)
  int.times { puts string }
end

# Test cases
repeat('Hello', 3)

# Expected output
# Hello
# Hello
# Hello
