# Fibonacci Numbers (Procedural)
# In the previous exercise, we developed a recursive solution to calculating the
# nth Fibonacci number. In a language that is not optimized for recursion,
# some (not all) recursive methods can be extremely slow and
# require massive quantities of memory and/or stack space.
#
# Ruby does a reasonably good job of handling recursion, but it isn't designed
# for heavy recursion; as a result, the Fibonacci solution is only useful up to
# about fibonacci(40).
# With higher values of nth, the recursive solution is impractical.
# (Our tail recursive solution did much better,
# but even that failed at around fibonacci(8200).)
#
# Fortunately, every recursive method can be rewritten as a
# non-recursive (procedural) method.
#
# Rewrite your recursive fibonacci method so that it computes
# its results without recursion.
#
# Examples:

# input
#   integer - the sequence number to calculate fib up to
# output
#   integer - the value at the inputted location

# given a number n
# set a, b to 1
# loop up to the number n
#   - combine a + b
#   - assign the value of b, to the value of a
#   - assign the sum of a + b to the value of b
# return b

def fibonacci(n)
  return 1 if n <= 2
  a, b = [0, 1]
  2.upto(n) do
    sum = a + b
    a = b
    b = sum
  end
  b
end

# 1 # 1
# 2 # 1
# 3 # 2 (1) (2)
# 4 # 3 (1) (2) (3)

# p fibonacci(20) == 6765
# p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501
