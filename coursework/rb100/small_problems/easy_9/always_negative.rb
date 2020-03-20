# Always Return Negative
# Write a method that takes a number as an argument. If the argument is a
# positive number, return the negative of that number.
# If the number is 0 or negative, return the original number.

# input
# - int
# output
# - int

# given a number
# if number is positive, return the negative
# if number is 0 or negative, return the original number

# algo
# num > 0 ? -num : num

def negative(num)
  num > 0 ? -num : num
end

# Test cases
p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby