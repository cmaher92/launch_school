# fibonacci without recursion
# medium_1, problem 9

# < Integer; the nth fib number to calculate
# > Integer; the value of the nth fib number
# ! don't use recursion
# &
# keep track of which number we're at
# keep track of last two numbers
# reassign last two numbers based on sum
# loop n number of times
#   first, second = 0, 1
#   sum = first + second
#   first, second = second, sum
# return sum

def f(n)
  sequence = [1, 1]
  (n - 2).times do
    sequence << sequence[-1] + sequence[-2]
  end
  sequence[-1].to_s[-1].to_i
end

p f(20)
p f(100)
p f(100001)