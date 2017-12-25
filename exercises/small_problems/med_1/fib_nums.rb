# Fibonacci Numbers (Recursion)
# The Fibonacci series is a sequence of numbers starting with 1 and 1 where each
# number is the sum of the two previous numbers:
# the 3rd Fibonacci number is 1 + 1 = 2,
# the 4th is 1 + 2 = 3,
# the 5th is 2 + 3 = 5, and so on.
#
# In mathematical terms:
# F(1) = 1
# F(2) = 1
# F(n) = F(n - 1) + F(n - 2) where n > 2
# Sequences like this translate naturally as "recursive" methods.
# A recursive method is one in which the method calls itself.
#
# For example:
# def sum(n)
#   return 1 if n == 1
#   n + sum(n - 1)
# end
# p sum(9)
# sum is a recursive method that computes the sum of all integers between 1 and n.

#
# Recursive methods have three primary qualities:
# They call themselves at least once.
# They have a condition that stops the recursion (n == 1 above).
# They use the result returned by themselves.
# In the code above, sum calls itself once;
# it uses a condition of n == 1 to stop recursing;
# and, n + sum(n - 1) uses the return value of the recursive call to
# compute a new return value.

# Write a recursive method that computes the nth Fibonacci number,
# where nth is an argument to the method.

# input
#   integer - the fibonacci sequence to compute to
# output
#   integer - the fibonacci value at the inputted position
#
# Determine how to do the fib sequence without using a method
# Then translate it into a recursive method

# n = 9
# prev_a = 0
# prev_b = 1
# prev_a + prev_b = fib
# prev_a = prev_b
# prev_b = fib
# count += 1

# prev_a = 1
# prev_b = 2
# prev_a + prev_b = fib
# prev_a = prev_b
# prev_b = fib
# count += 1

# If I pass 1, need 1 returned
# If I pass 2, need 1 returned
# If I pass 3, need 2 returned
# If I pass 4, need 3 returned

def fibonacci(n)
  # because the first 2 values in fib, are 1's
  return 1 if n == 1 || n == 2

  fibonacci(n-1) + fibonacci(n-2)
end


# Examples:
p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
