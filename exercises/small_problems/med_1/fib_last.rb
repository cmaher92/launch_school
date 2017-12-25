require 'pry'

def fibonacci_last(n)
  fibonacci(n).to_s[-1].to_i
end

def fibonacci(n)
  # if n > 1000
  #   n = n.digits[0..1] + [n.digits[-1]]
  #   n = n.join.to_i
  # end
  # binding.pry
  last_two = [1, 1]
  3.upto(n) do |i|
    last_two = [last_two.last, (last_two.first + last_two.last)]
  end

  last_two.last
end

# This solution simply mods the result by 10, drastically cutting down computing
# time needed to solve the problem. The issue is that eventually this too
# becomes slow. How can we modify this function to handle numbers regardless of
# size?

# instead of statically modding the result by 10, what if we dynamically
# modified based on the size of the sum?
# once the result is at least
# no change in computing speed even when increasing the size of the number.

# So, the pattern repeats every 100.

# p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# # p fibonacci_last(101)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1001)
# p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# p fibonacci_last(123456789) # -> 4
# p fibonacci_last(123456789987745) # -> 4
# p fibonacci_last(45)
