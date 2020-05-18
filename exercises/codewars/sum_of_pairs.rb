# Sum of Pairs
=begin
Given a list of integers and a single sum value, return the first two values (parse from the left please) in order of appearance that add up to form the sum.

sum_pairs([11, 3, 7, 5],         10)
#              ^--^      3 + 7 = 10
== [3, 7]

sum_pairs([4, 3, 2, 3, 4],         6)
#          ^-----^         4 + 2 = 6, indices: 0, 2 *
#             ^-----^      3 + 3 = 6, indices: 1, 3
#                ^-----^   2 + 4 = 6, indices: 2, 4
#  * entire pair is earlier, and therefore is the correct answer
== [4, 2]

sum_pairs([0, 0, -2, 3], 2)
#  there are no pairs of values that can be added to produce 2.
== None/nil/undefined (Based on the language)

sum_pairs([10, 5, 2, 3, 7, 5],         10)
#              ^-----------^   5 + 5 = 10, indices: 1, 5
#                    ^--^      3 + 7 = 10, indices: 3, 4 *
#  * entire pair is earlier, and therefore is the correct answer
== [3, 7]
Negative numbers and duplicate numbers can and will appear.

NOTE: There will also be lists tested of lengths upwards of 10,000,000 elements. Be sure your code doesn't time out.
=end

# input:
#   - array of integers
#   - sum
# output:
#   - pair of integers as an array that equal the sum and appear first
# constraints:
#   - the returned pair is the pair that appears first
#     - appears first means that that both numbers in the pair come before one of the indices of the other pair
#   - return nil if no numbers equal to sum
#   - negative numbers and duplicates will appear
# test input/output
#   -
# algorithm/data structure:
#  - set local variable to an array that holds a pair of indices
#  - find all pairs that are equivalent to sum
#   - iterate over each number with index, representing the first num in pair
#     - check numbers from index..end of list to see if any equal sum
#     - find second numbers from first + 1 .. end of list OR up to pair's second index (anything after will be higher so no need to check)

# find first pair that equals sum and save as pair array
# IF pair array is empty, return nil
# ELSE find a lower pair
# - call itself passing in slice of array from [0...index of second number] and sum

# [1, 5]
  # sum_pairs([10, 5, 2, 3, 7], 10)
  # [3, 4]
    # sum_pairs([10, 5, 2, 3], 10)
    # nil 

# find pair
# if no pair, return nil
# if pair, call itself
require 'pry'

def sum_pairs(nums, sum, lowest_pair = nil)
  idx  = 0
  pair = []

  nums.each_index do |first|
    second = first + 1
    while second < nums.length
      if nums[first] + nums[second] == sum
        pair = [nums[first], nums[second]]
        idx = second
        break
      end
      second += 1
      break if !pair.empty?
    end
  end

  if pair.empty?
    lowest_pair
  else
    pair = sum_pairs(nums[0...idx], sum, pair)
  end
end

p sum_pairs([10, 5, 2, 3, 7, 5], 10) #== [3, 7]
p sum_pairs([4, 3, 2, 3, 4], 6)      #== [4, 2]
p sum_pairs([0, 0, -2, 3], 2)        #== nil
