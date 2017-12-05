=begin
Combine Two Lists

Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same number of elements.

input
  two arrays
output
  combined arrays, alternating elements from both arrays

algorithm
  given two arrays
  set counter to 1
  set element to 0
  create a loop
    add add element to the counter's position in the first array
    increment counter by 2
    increment element by 1
    break when counter is greater than or equal to the length of both passed in arrays
=end

# def interleave(arr, arr2)
#   counter = 1
#   idx = 0
#   loop do
#     break if idx == arr2.size
#     arr.insert(counter, arr2.fetch(idx))
#     counter += 2
#     idx     += 1
#   end
#   arr
# end

# further exploration
def interleave(arr, arr2)
  arr.zip(arr2).flatten
end

# Test cases
p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

=begin
Solution

def interleave(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end
Discussion

In our solution, we use #each_with_index to get values and index numbers for 
array1, then use the index number to access the corresponding element in array2.

Further Exploration

Take a few minutes to read about Array#zip. #zip doesn't do the same thing as 
interleave, but it is very close, and more flexible. 
In fact, interleave can be implemented in terms of zip and one other
method from the Array class. See if you can rewrite interleave to use zip.
=end