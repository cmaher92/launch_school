# What does the following return when working with a duplicated object?

arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

p arr1.object_id
p arr1
puts
p arr2.object_id
p arr2
puts