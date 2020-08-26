# input:
#   - collection and block
# output:
#   - true if the block returns false for all of the
#     element values
#   - false otherwise
# rules/constraints:
#   - stop processing if block execution returns true
#   - if collection empty return true
#   - no standard methods
# test input/output
#   -
# algorithm/data structure:
#   - given a collection
#   - for each element in collection
#     - yield to block
#     - return false if block returns false
#   - return true

def none?(collection)
  collection.each { |element| return false if yield(element) }
  true
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true
