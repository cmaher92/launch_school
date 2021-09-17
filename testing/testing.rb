# Tests

# Test Suite
# This is the entire set of tests that accompanies your program or application.
# You can think of this as all the tests for a project.

# Test
# This describes a situation or context in which tests are run.

# Assertion
# This is the actual verification step to confirm that the data returned by
# your program or application is indeed what is expected.

require 'minitest/autorun'
require 'minitest/reporters' # minitest-reporters gem
Minitest::Reporters.use!

# you must inherit from Minitest::Test
class MyFirstTest < Minitest::Test

  # define your tests as instance methods beginning with test_
  def test_first_test
    # skip
    skip

    # fails unless result is truthy
    assert true

  end


end

require_relative 'car'

class CarTest < Minitest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  # Expectation syntax
  # Grouped with 'describe' blocks
  describe 'Car#wheels' do

    # individual tests are written with 'it'
    it 'has 4 wheels' do
      car = Car.new
      _(car.wheels).must_equal 4 # this is the expectation
    end
  end

  def test_bad_wheels
    skip
    car = Car.new
    assert_equal(3, car.wheels)
  end
end

# Reading the output
# the '.' means the test was run and nothing went wrong
# the 'S' means there was a test that was skipped
# the 'F' means there was a test that failed

# Run options: --seed 62238

# Running:

# CarTest .

# Finished in 0.001097s, 911.3428 runs/s, 911.3428 assertions/s.

# 1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
