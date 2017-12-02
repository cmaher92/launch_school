=begin
Fibonacci Number Location By Length

The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...)
such that the first 2 numbers are 1 by definition, and each subsequent number
is the sum of the two previous numbers. This series appears throughout
the natural world.

Computationally, the Fibonacci series is a very simple series, but the results
grow at an incredibly rapid rate. For example, the 100th Fibonacci number
is 354,224,848,179,261,915,075 -- that's enormous, especially considering
that it takes 6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci
number that has the number of digits specified as an argument.
(The first Fibonacci number has index 1.)

input
  integer that specifices the number of digits the fib number has
output
  integer that matches the number of digits passed in, return it's index

  create a fibonacci sequence that stops once the digit being appended
    length is equal to the length inputted

  current = 0
  x = 0
  while current.chars.size < length
    current = fib[x] + fib[x + 1]
    x += 1
    fib << current
  end

  first = 1
  second = 1
  index = 2
  create the first and second variables to use for calculating fib
  loop that creates the fib sequence
    index += 1
    fib = first + second
    break if the current number's size is greater or equal to length

    first = second
    second = fib
=end


def find_fibonacci_index_by_length(length)
  first  = 1
  second = 1
  index  = 2

  loop do
    index += 1
    fib = first + second
    break if fib.digits.size >= length

    first = second
    second = fib
  end

  index
end

p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
