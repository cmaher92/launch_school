# fibonacci numbers (recursion)
# medium 1, problem 8

# < Integer; the nth fibonacci number
# > Integer; the fibonacci number
# ! use recursion
# ! condition that stops the recursion
# ! use the result returned by itself
# ! [1, 1, 2, 3, 5]

# def factorial(n)
#   return 1 if n == 1
#   n * factorial(n - 1)
# end

# factorial(5)

# factorial(5) is called
# n * factorial(4) * factorial(3) * factorial(2) * factorial(1) #=> 1
# 5 * 4 * 3 * 2 * 1
# 120

# if n < 2, return 1
# f(n-1) + f(n-2)

def fib(n)
  return 1 if n <= 2
  fib(n-1) + fib(n-2)
end

# problems
# calls itself twice, recursively until n <= 2, leads to many calls
# 

