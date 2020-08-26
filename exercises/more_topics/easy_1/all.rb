# - Write a method called all? that behaves similarly for Arrays.
#     - It should take an Array as an argument, and a block.
#     It should return true if the block returns true for all of the element
#     values. Otherwise, it should return false.
#     - Your method should stop processing elements of the Array
#     as soon as the block returns false.
#     - If the Array is empty, all? should return true,
#     regardless of how the block is defined.
#     - Your method may not use any standard ruby method
#     that is named all?, any?, none?, or one?.

# input:
#   - collection, block
# output:
#   - true if all yields of block return true
#   - false if not all do
# rules/constraints:
#   - return false right away if yield returns false
# test input/output
#   - if empty collection is passed in return true
# algorithm/data structure:
#   - iterate over each element
#     - yield each element, returning false if yield returns false
#   - return true

def all?(collection)
  collection.each { |element| return false unless yield(element) }
  true
end

# Examples:
p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true
