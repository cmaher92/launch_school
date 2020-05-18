# Product of consecutive fibonacci numbers
=begin
The Fibonacci numbers are the numbers in the following integer sequence (Fn):
0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, ...
such as
F(n) = F(n-1) + F(n-2) with F(0) = 0 and F(1) = 1.
Given a number, say prod (for product), we search two Fibonacci numbers F(n) and F(n+1) verifying
F(n) * F(n+1) = prod.
Your function productFib takes an integer (prod) and returns an array:
[F(n), F(n+1), true]

If you don't find two consecutive F(m) verifying F(m) * F(m+1) = prod you will return
[F(m), F(m+1), false]
F(m) being the smallest one such as F(m) * F(m+1) > prod.

productFib(714) # should return [21, 34, true] 
productFib(800) # should return [34, 55, false]
=end

# input:
#   - Integer
# output:
#   - Array containing the two numbers in the sequence, and boolean
# constraints:
#   - if prod is not found, find first prod greater than input
# test input/output
#   -
# algorithm/data structure:
#   - calc fib numbers until product >= input
#     - set local variable 'fib_nums' array to hold 0, 1
#     - loop until multiplying nums in 'fib_nums' is greater than or equal to input
#       - calculate next fib number
#         - sum 'fib_nums'
#         - push sum onto 'fib_nums'
#         - shift first number from 'fib_nums'
#   - if prod of fib_nums is equal to input
#     - return fib_nums + true
#   - else
#     - return fib_nums + false

def productFib(prod)
  a, b = [0, 1]
  until a * b >= prod
    a, b = b, (a + b)
  end
  [a, b, (a * b == prod)]
end

p productFib(714) # should return [21, 34, true] 
p productFib(800) # should return [34, 55, false]
