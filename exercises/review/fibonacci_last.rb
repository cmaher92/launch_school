require 'pry'
require 'minitest/autorun'
#

# Details:
# Input:
# Output:
# Requirements:

# EXAMPLES
# var: 9 --> 11

# DATA STRUCTURE

# ALGORITHM
# 1.

def fibonacci_last(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last.digits.first
end

class Test < Minitest::Test
  def test_last_fib
    assert_equal(0, fibonacci_last(15))        # -> 0  (the 15th Fibonacci number is 610)
    assert_equal(5, fibonacci_last(20))        # -> 5 (the 20th Fibonacci number is 6765)
    assert_equal(5, fibonacci_last(100))       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
    assert_equal(1, fibonacci_last(100_001))   # -> 1 (this is a 20899 digit number)
    assert_equal(3, fibonacci_last(1_000_007)) # -> 3 (this is a 208989 digit number)
    assert_equal(4, fibonacci_last(123456789)) # -> 4
  end
end
