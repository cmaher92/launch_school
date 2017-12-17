=begin
Does My List Include This?

Write a method named include? that takes an Array and a search value as arguments. 
This method should return true if the search value is in the array, 
false if it is not. You may not use the Array#include? method in your solution.

=end

# input
#   array, object (search value)
# output
#   boolean (true if search value in array, false if it is not)
  
# for each element in the arr
# check to see if search value matches any element
#   iterate over it and compare
# return boolean

def include?(arr, search)
  arr.each do |obj|
    return true if obj == search
  end
  false
end


# Test cases
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false


=begin
Solution

The easy way
def include?(array, value)
  !!array.find_index(value)
end


A slightly harder way
def include?(array, value)
  array.each { |element| return true if value == element }
  false
end
Discussion

The first method uses Array#find_index to scan the array for the first element that has the specified value. find_index returns the index number of the found element, which will always have a truthy value, or nil if no such element is present. We then use !! to force the return value to true or false in accordance with the implied promise of the ? in include?.

The second method does essentially the same thing, but it uses each instead of find_index. This takes a little bit more work, since we are explicitly returning false if the value is not found.

Further Exploration

Can you think of other solutions to this problem? There are lots of different ways to get the same result.
=end