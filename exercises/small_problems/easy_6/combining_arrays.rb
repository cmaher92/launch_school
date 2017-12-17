=begin
Combining Arrays

Write a method that takes two Arrays as arguments, and returns an
Array that contains all of the values from the argument Arrays.
There should be no duplication of values in the returned Array, even if
there are duplicates in the original Arrays.


input
  2 arrays
output
  array with combined values from inputted array, remove duplicates

  given two arrays
  place elements from arrays into a new array
    pop elements from the second array into the first until the array is empty
  remove repeated elements
=end

def merge(arr, arr2)
  # while !arr2.empty?
  #   arr << arr2.pop
  # end
  #
  # arr.sort.uniq
  arr | arr2
end

# Example
p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
