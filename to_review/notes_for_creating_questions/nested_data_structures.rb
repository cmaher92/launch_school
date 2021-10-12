# RB101
# Lesson 5: Nested Data Structures Review
# Date: 09/21/2021

# Referencing collection elements
arr = [[0, 1], [2]]

arr[0][1] # => 1

# Updating inner collection elements with '#[]='
arr = [[1, 3], [2]]

arr[1] = "hi there" # destructive

arr # => [[1, 3], "hi there"]

# Adding to inner collection elements with '<<'
arr = [[1], [2]]

# add element to array object referenced by the element in 'arr''s 0th index
arr[0] << 3
arr # => [[1, 3], [2]]

# Working with array of hash objects
arr_of_hashes = [{ a: 'ant' }, { b: 'bear' }]

arr_of_hashes[0][:c] = 'cat' # destructive

arr_of_hashes # => [{ a: 'ant', c: 'cat'}, {b: 'bear'}]

# Variable reference for nested collections
# - one often confusing aspect of working with nested collections is when
#   variables are referencing inner collections directly.
# - the local variables 'a' and 'b' are referencing two 'Array' instances.
a   = [1, 3]
b   = [2]
arr = [a, b]
 
arr # => [[1, 3], [2]]

# - what happens when we modify 'a' after placing it within 'arr'?
a[1] = 5
arr # => [[1, 5], [2]]

# - notice that by modifying the array that the local variable 'a' is pointing to,
#   with the '#[]=' method, the modification affects the 'arr' object as well.
# - this change occurs because the Array instance that 'a' is referencing, is the same
#   instance that 'arr' references.
# - see https://launchschool.com/lessons/c53f2250/assignments/1a6a2665 for chart describing
#   this in more detail.

# - what happens if we modify the first element in 'arr'
arr[0][1] = 10
arr # => [[1, 10], [2]]
a   # => [1, 10]

# - there is no difference because both arr[0] and 'a' reference the same object

# Shallow copy
# - Ruby provides two methods that let us copy an object, including collections:
#   - #dup
#   - #clone
# - both of these methods create a 'shallow copy' of an object, meaning that only
#   the object that the method is called on is copied.
# - if the object contains other objects (e.g. nested collections) then those objects
#   will be shared, not copied.
arr1 = ['a', 'b', 'c']
arr2 = arr1.dup

arr2[1].upcase!

arr2 # => ['a', 'B', 'c']
arr1 # => ['a', 'B', 'c']
# - note that even though 'arr2' is not the same object as 'arr1', the objects 'a', 'b', and 'c'
#   are the same objects referenced by both 'arr1' and 'arr2'.

# What is the return value?
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

arr1 # => ["a", "b", "c"]
arr2 # => ["A", "B", "C"]

# - 'map!' modifies the outer object 'arr2' and 'map' is reassigning each inner element
#   not modifying the element's within it, 'arr1' is therefor left unchanged.

# What is the return value here?
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.each do |char|
  char.upcase!
end

arr1 # => ["A", "B", "C"]
arr2 # => ["A", "B", "C"]

# - in this case '#each' is called on 'arr2' which then  calls '#upcase!' on  each element within
#   'arr2'. The method '#upcase!' mutates each of those elements therefor the modifications 
#    will be reflected when looking at the elements within 'arr1' as both instances reference
#   the same objects.

# Freezing objects
# - the main difference between '#dup' and '#clone' is that 'clone' preserves the frozen
#   state of the object.
arr1 = ['a', 'b', 'c'].freeze
arr2 = arr1.clone
arr2 << 'd'
# => RuntimeError: can't modify frozen array

# - 'dup' does not preserve the frozen state of the object.
arr1 = ['a', 'b', 'c'].freeze
arr2 = arr1.dup

arr2 << 'd'

arr2 # => ['a', 'b', 'c', 'd']
arr1 # => ['a', 'b', 'c']

# - Why would you 'freeze' an object?
str = 'abc'.freeze
str << 'd'
# => RuntimeError: can't modify frozen string

# - In ruby, objects can be frozen in order to prevent them from being modified.

# - If a frozen object contains other objects, those contained objects will not be frozen if
#   'freeze' is called on outer object.
frozen_arr = ['a', 'b', 'c']
frozen_arr << 'b' # => RuntimeError: can't modify frozen array
frozen_arr[0] << '1' # => ['a1', 'b', 'c']

# Deep copy
# - There is no built-in way in ruby to create a 'deep copy'  therefor it's important to
#   understand how 'freeze', 'dup', and 'clone' work and the side effects that they have.