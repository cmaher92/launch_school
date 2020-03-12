# happy number
require 'pry'

def is_happy(n)
  # input - int
  # output - boolean
  #   true - if the sum of the number is 1
  #   false - if the loop continues endlessly
  
  # keep an array of the sums
  
  # separate, square and sum
    # Integer#digits to separate into an array
    # map each number of the array, squaring each number
    # reduce the altered array
    # check the sum against the array of sums, if it's in their return false
    # otherwise, if it's 1 return true
    # if it's neither in the array or 1, loop again
  sums = []
  sums << n
  loop do
    p sums
    # binding.pry
    n = n.digits.map!{ |x| x*x }.reduce(:+)
    return false if sums.include?(n)
    return true if n == 1
    sums << n
  end
end

p is_happy(18)