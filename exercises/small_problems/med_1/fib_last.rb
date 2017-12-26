require 'pry'

def fibonacci_last(n)
  fibonacci(n).to_s[-1].to_i
end

def fibonacci(n)
  if n.digits.size > 3
    n = n.digits.first(3).reverse.join.to_i
  end
  last_two = [1, 1]
  3.upto(n) do |i|
    last_two = [last_two.last, (last_two.first + last_two.last)]
  end

  last_two.last
end

# So, the pattern repeats every 60.
# if the num.digits.count > 3, the the last 3 and save as num

# After reviewing the other student's solutions the pattern approach
# was indeed the proper approach, however the better way to handle it
# is to mod the num by 60.
# This will always return a number less than 60 (mod returns remainder) of
# num / 60. So this solution calculates much faster and is easier to
# understand. 

p fibonacci_last(15)              # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)              # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)             # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)         # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007)       # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789)       # -> 4
p fibonacci_last(123456789987745) # -> 5
# p fibonacci_last(25)
