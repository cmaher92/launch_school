=begin
Reversed Arrays (Part 2)

Write a method that takes an Array, and returns a new Array with the elements
of the original list in reverse order. Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method
you wrote in the previous exercise.

the difference between this method and the last is that
I cannot modify the array passed in, so instead of adding to the same arr
simply add to a new array

given an array (list)
initialize a new local variable that is an array
  loop over the list n number of times
    add each item to the new array starting with the last item of the list
    arr[i-1] = list[-i]

return the newly created list
=end

def reverse(list)
  arr = []
  (list.length).times do |i|
    # adds each item to the arr starting at the last element of list
    # the i passed in here begins at 0 and with each loop increments by 1
    # therefor by changing the sign and adding 1 it begins with -1
    # arr[0] = list[-1] first iteration
    # arr[0] = list[-2] second iteration
    # ...
    arr[i] = list[ -(i + 1) ]
  end
  arr
end

# test cases
p reverse([1,2,3,4]) == [4,3,2,1]          # => true
# p reverse(%w(a b c d e)) == %w(e d c b a)  # => true
# p reverse(['abc']) == ['abc']              # => true
# p reverse([]) == []                        # => true

# p list = [1, 2, 3]                      # => [1, 2, 3]
# p new_list = reverse(list)              # => [3, 2, 1]
# p list.object_id != new_list.object_id  # => true
# p list == [1, 2, 3]                     # => true
# p new_list == [3, 2, 1]                 # => true
