require 'pry'
require 'minitest/autorun'

# DETAILS
# Input: integer; 'nth'; the position to calculate fibonacci to
# Output: integer; the result for the 'nth' number in the fibonacci sequence
# Requirements:
# - non-recursive (compute without using recursion)

# EXAMPLES
#

# DATA STRUCTURE
# - hash, each key is the position in the fib sequence, each value is the result
# { 1 => 1, 2 => 1 ... }

# ALGORITHM
# - create array containing values of fib sequence
# - return 1 if nth is 1 or 2
# - create a counter variable 'last' and 'second_to_last' set to 1 and 0
# - loop until the size of the sequence is the same as the nth
#   - sum the sequence[last] + sequence[second_to_last] and append to sequence
#   - increment last and second_to_last
#   - append sum to sequence
#   - return last value of sequence if sequence size is the same as nth



# my solution
def fibonacci(nth)
  return 1 if [1, 2].include?(nth)

  sequence = [1, 1]
  last = 1
  second_to_last = 0

  loop do
    sequence << sequence[last] + sequence[second_to_last]
    last += 1
    second_to_last += 1
    break if sequence.size == nth
  end

  sequence.last
end

# provided solution
def fibonacci(nth)
  first, last = [1, 1] # first, last represent values not indices
  3.upto(nth) do # starts at 3, because first 2 values already calculated
    first, last = [last, first + last] # fancy parallel assignment
  end

  last
end



class Test < Minitest::Test
  def test_result
    assert_equal(1, fibonacci(1))
    assert_equal(1, fibonacci(2))
    assert_equal(6765, fibonacci(20))
    assert_equal(354224848179261915075, fibonacci(100))
  end
end
