# fibonacci numbers (last digit)
# set: small problems: med 1
# date: 09/22/2021

require 'minitest/autorun'

# algo
# - assign first and last to 1, respectively
# - loop from 3 up to the nth value
#   - assign last -> first
#   - calculate last
#       - (first + last) mod 10

# improvements
# - last fib digit repeats every 60

def fibonacci_last(nth)
  first, last = [1, 1]

  3.upto(nth) do
    first, last = [last, (first + last) % 10]
  end

  last
end

class FibTest < Minitest::Test
  make_my_diffs_pretty!

  def test_base_cases
    assert_equal(0, fibonacci_last(15))
    assert_equal(5, fibonacci_last(20))
    assert_equal(5, fibonacci_last(100))
    assert_equal(1, fibonacci_last(100_001))
    assert_equal(3, fibonacci_last(1_000_007))
    assert_equal(4, fibonacci_last(123_456_789))
  end
end