=begin
Reversed Arrays (Part 1)

Write a method that takes an Array as an argument,
and reverses its elements in place; that is,
mutate the Array passed into this method.
The return value should be the same Array object.

You may not use Array#reverse or Array#reverse!.

given an array
initialize a local variable index

reverse it's elements
[1, 2, 3]
[3, 2, 1]
  loop n number of times
  n number is the length of the array
  pop an element off the array
  add it to the array defined by the index using Array#insert(index, object)
  increment the index variable

return the array, should be same array object
=end
require 'pry'

def reverse!(list)
  (list.length).times do |i|
    list.insert((i), list.pop)
  end
  list
end

# Test cases
list = [1,2,3,4]
p result = reverse!(list) # => [4,3,2,1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b c d e)
p reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]

p list = ['abc']
p reverse!(list) # => ["abc"]
p list == ["abc"]

list = []
p reverse!(list) # => []
p list == []
