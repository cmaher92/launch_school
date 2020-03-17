# Given this code, what would be the final values of a and b?
# Try to work this out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2     # not destructive
arr[1][1] += 1
# a
# => 2

# b
# => [5, 8]
