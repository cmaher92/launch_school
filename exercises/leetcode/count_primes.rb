require 'pry'

def is_prime?(num)
  # return true if prime
  # return false if not prime
  (2..num).each do |n|
    next if n == num
    return false if num % n == 0
  end
  true
end

def count_primes(n)
  # input: int
  # output: int
  # count the number of prime nums less than a non-negative input
  # A prime number is a numeral that is greater than 1
  # and cannot be divided evenly by any other number except 1 and itself
  results = (1..n).select do |num|
    # check each num to see if it's prime
    # if it's prime keep it
    is_prime?(num)
  end

  results.count

end
