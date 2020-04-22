# reversed arrays

# input: array
# output: same array object, mutated

# rules:
#   explicit:
#     - the return value should be the same object
#     - you may not use Array#reverse or Array#reverse!
#   implicit:
#     - empty array should return empty array object
#     - will the empty array be the same object? IS it possible?

# data structure:
#   array

# algorithm
# given an array
# reverse the order of the array
#   - loop popping items off of the end, inserting into the beginning, based on index-position
#   - ininit an index var as 0, outside loop
#   - break when the index var is == to the size of the array
#   - pop item from array
#   - insert item to array using insert(index, item)
#   - increment index
#   - [1, 2, 3].pop
#   - [1, 2].insert(3, 0)
#   - [3, 1, 2]
#   - ....

def reverse!(list)
  pos = 0
  loop do
    item = list.pop
    list.insert(pos, item)
    pos += 1
    break if pos == list.size
  end
  list
end


# test cases:
p list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

p list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]

p list = []
p reverse!(list) == []
p list == []
