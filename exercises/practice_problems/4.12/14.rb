# what is returend?

arr1 = ["a", "b", "c"]
arr2 = arr1.dup

p arr1.object_id, arr2.object_id
# separate objecs

arr2.map! do |char|
  char.upcase
end

# mutates the 2nd array object, which doesn't affect the frst array
p arr1 # => ['a', 'b', 'c']
p arr2 # => ['A', 'B', 'C']