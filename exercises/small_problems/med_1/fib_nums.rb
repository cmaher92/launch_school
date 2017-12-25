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


def fibonacci(n)
  # because the first 2 values in fib, are 1's
  return 1 if n == 1 || n == 2

  fibonacci(n-1) + fibonacci(n-2)
end

# faults?
  # the number of method calls
  # it has to calculate the entire fib sequence
  # uses massive amounts of space, can reasonably handle up to fibonacci(40)

# tail recursive solution provided by Launch School
# runs much faster, can handle up to around fibonacci(8200)
def fibonacci_tail(nth, acc1, acc2)
  if nth == 1
    acc1
  elsif nth == 2
    acc2
  else
    fibonacci_tail(nth - 1, acc2, acc2 + acc1)
  end
end

def fibonacci(nth)
  fibonacci_tail(nth, 1, 1)
end

fibonacci(4)
# fibonacci_tail(4, 1, 1)
  # fibonacci_tail(3, 1, 2)
    # fibonacci_tail(2, 2, 3)
    # returns 3
# fibonacci returns 3


# Examples:
p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
