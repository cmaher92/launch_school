require 'pry'

# def is_prime?(num)
# end
#
# p is_prime?(10)
# p is_prime?(2)

# given a number (n)
# count the number of prime numbers from 1 - n
# start at 2, 1 is not a prime number
# n / 2, 3, 4, 5, 6, etc..

def count_primes(number)
  # create an array from 2-num
  # for each number in the array of possible primes
    # modulo the number by each n
    # if the number % n is 0, it's not a prime number
    # unless the number and n are the same
  possible_primes = (2...number).to_a
  possible_primes.select! do |num|
    # need to return true if num is prime, false if it is not
    # binding.pry if num == 3
    results = (2...num).select do |n|
      # if num % n == 0, means that n evenly divides into num making it not prime
      num % n == 0
    end
    results.empty?
    # any number within results evenly divided into the num
    # making the num not prime
    # so if results is empty, it means that nothing divided into the num
    # making the num prime
  end
  possible_primes.count
end

p count_primes(10) == 4
