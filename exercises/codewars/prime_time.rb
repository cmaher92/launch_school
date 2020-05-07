# prime time

# We need prime numbers and we need them now!
# Write a method that takes a maximum bound and returns 
# all primes up to and including the maximum bound.

#For example:
# prime(11)
# Should return an array that looks like this:
# [2, 3, 5, 7, 11]

# input:
#   - integer; represents limit
# output:
#   - array; all prime number upto and including limit if prime
# constraints:
#   - prime number
#     - a whole number greater than 1 that is not a product of two smaller numbers
#     - can be checked by modulos operator
#       - if it returns 0 by n % 2...n then it is not prime
#       - modulo by itself or 1 doesn't count
# mental model:
#   - make a list of numbers from 2..n
#   - test if each of those numbers is prime
#   - if it is prime, keep it in the list, if it isn't remove it
# algorithm/data structure:
#   - create a range, reduce range to only prime numbers
#     - pass num to block
#     - check if all num % (2..num-1) != 0, if true prime, if false not prime
#   - return result
require 'pry'
def prime(n)
  (2..n).select do |num| 
    (2..(num**0.5)).all? { |operand| num % operand != 0 }
  end
end

p prime(11)
