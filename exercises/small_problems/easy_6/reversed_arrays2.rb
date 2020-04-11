# reversed arrays
# part 2

# input: array
# output: new array
# rules:
#   do not modify the original list
#   create new array with reversed items

# algorithm
# given an array
# init new array
# iterate backwards over the given array
#   append each item to the new array
#   decrement index
#   break when -index == length of the array

def reverse(list)
  list.inject([]) { |arr, var| arr.unshift(var) }
end

# test cases:
p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true 