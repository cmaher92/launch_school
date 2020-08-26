# input:
#   - collection and block
# output:
#   - true or false
# rules/constraints:
#   - stop processing elements as soon as block returns true
#   a second time
# algorithm/data structure:
#   - iterate over each element
#   - initialize true_count to 0
#   - yield to block
#     - if block returns true increment true_count
#     - return false if true_count > 1
#   - return true if true_count is 1, otherwise false

def one?(collection)
  true_count = 0
  collection.each do |element|
    true_count += 1 if yield(element)
    return false if true_count > 1
  end
  true_count == 1 ? true : false
end

p one?([1, 3, 5, 6]) { |value| value.even? } == true
p one?([1, 3, 5, 7]) { |value| value.odd? }  == false
p one?([2, 4, 6, 8]) { |value| value.even? } == false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p one?([1, 3, 5, 7]) { |value| true }           == false
p one?([1, 3, 5, 7]) { |value| false }          == false
p one?([]) { |value| true }                     == false
