# sum of pairs
# from collections named 'struggled'
# interested to see how I fair on something I previously struggled with
# https://www.codewars.com/kata/54d81488b981293527000c8f/train/ruby

# input; array of ints
# output; arr of two nums that equal num after being summed
# nil if no pairs
require 'pry'

def sum_pairs(ints, sum)
  seen = {}
  ints.each do |int|
    # saves each int to a hash to store that the int has been seen
    # takes the sum, subtracts the current int, if the remainder is in the 
    # seen, returns the remainder and the int
    return [sum-int, int] if seen[sum-int]
    seen[int] = true
  end
  nil
end

p sum_pairs([10, 5, 2, 3, 7, 5], 10)