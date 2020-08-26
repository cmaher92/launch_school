# - Write a method called [[any?]] that behaves similarly for [[Array]]s.
# It should take an [[Array]] as an argument, and a block.
# It should return true if the block returns true for any of the element values.
# Otherwise, it should return false.

# - Your method should stop processing elements of the Array as soon as the
# block returns true.

# - If the Array is empty, any? should return false,
# regardless of how the block is defined.

# - Your method may not use any standard ruby method
# that is named all?, any?, none?, or one?.

# input:
#   - Array, and a block
# output:
#   - true if the block returns true for any of the element's values
#   - otherwise, false
# rules/constraints:
#   - stop iterating as soon as block returns true
#   - if empty, return false
# test input/output
#   -
# algorithm/data structure:
#   - given an array and a block
#   - if empty, return false
#   - for each element
#     - yield the block, passing in the element
#     - if block returns true, return true, else continue
#   - return false

def any?(collection)
  collection.each do |e|
    return true if yield(e)
  end
  false
end

# p any?({a: 1, b: 2, c: 3}) { |key, value| key == :a && value.odd? }

# p any?([1, 3, 5, 6]) { |value| value.even? } == true
# p any?([1, 3, 5, 7]) { |value| value.even? } == false
# p any?([2, 4, 6, 8]) { |value| value.odd? } == false
# p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# p any?([1, 3, 5, 7]) { |value| true } == true
# p any?([1, 3, 5, 7]) { |value| false } == false
# p any?([]) { |value| true } == false
