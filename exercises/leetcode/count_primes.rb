require 'pry'

# def is_prime?(num)
# end
#
# p is_prime?(10)
# p is_prime?(2)

def count_primes(n)
  # The Sieve of Eratosthenes
  # create an array of n numbers
  # start with the first number (2)
    # remove all multiples of that number

  table = Array.new(n) { |i| i }
  2.times { |i| table.delete(i) }
  

end

# p count_primes(10)
