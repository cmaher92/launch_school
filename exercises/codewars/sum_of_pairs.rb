# sum of pairs
# from collections named 'struggled'
# interested to see how I fair on something I previously struggled with

# input; array of ints
# output; arr of two nums that equal num after being summed
# nil if no pairs
require 'pry'

def sum_pairs(arr, num)
    # loop until reach second to last num
  pairs = []
  x = 0
  y = 1
  loop do
    break if x == arr.length - 1
    loop do
      break if y == arr.length
      pairs << [arr[x], arr[y]] if arr[x] + arr[y] == num
      y += 1
    end
    x += 1
    y = x + 1
  end
  pairs
  # if the entire pair is before the index of either of the other elements in another pair then it should be returned first
  # look at solving it this wait, or figuring out a way to solve it during the problem
end

p sum_pairs([10, 5, 2, 3, 7, 5], 10)