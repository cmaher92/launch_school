# input:
#   - Array, block
# output:
#   - Integer, count of number of times block returns true
# rules/constraints:
#   - cant use #count
# algorithm/data structure:
#   - given a collection
#   - initialize count to 0
#   - iterate over each element
#     - increment count if block returns true
#   - return count

# def count(collection)
#   count = 0
#   collection.each { |e| count += 1 if yield(e) }
#   count
# end

def count(collection)
  collection.map { |e| yield(e) }.reduce(0) do |acc, v|
    v == true ? (acc += 1) : acc
  end
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
