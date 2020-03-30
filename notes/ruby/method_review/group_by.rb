# Enumerable#group_by

# signatures
# enum.group_by { |obj| block } -> a_hash
# enum_group_by -> enumerator

# definition
# Groups the collection by result of the block.
# Returns a hash where the keys are the evaluated result from the block 
# and the values are arrays of elements in the collection that correspond
# to the key/.

# examples
arr = [1, 2, 3, 4, 5, 6]
arr.group_by { |v| v }
# => {1=>[1], 2=>[2], 3=>[3], 4=>[4], 5=>[5], 6=>[6]}

arr.group_by { |i| i%3 }
# => {0=>[3, 6], 1=>[1, 4], 2=>[2, 5]}
# i in this case is 1..
# i%3 => 1
# the result (1) becomes the key, the i value (1) is added to the value array for 1

# 2%3 => 2 (key)
# 2 is added to value arr

[1, 1, 2, 2, 3, 3].group_by { |num| num }
# => {1=>[1, 1], 2=>[2, 2], 3=>[3, 3]}
# the block will evaluate to the num passed in
# so 1 => [1]
# then 1 => [1, 1]
# 2 => [2]
# ...

