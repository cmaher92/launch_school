# recursive_fib.rb
# set: small problems/ medium 1
# date: 09/21/2021

require 'minitest/autorun'
require 'pry'

# input: 'nth'
# - integer
# output: 
# - integer



def fib(nth)
  return 1 if nth == 1 || nth == 2
  fib(nth - 2) + fib(nth - 1)
end

class FibTest < Minitest::Test
  def test_examples
    args    = [1, 2, 3, 4, 5, 12, 20]
    results = [1, 1, 2, 3, 5, 144, 6765]
    args.each_with_index do |arg, idx|
      assert_equal(results[idx], fib(arg))
    end
  end
end