=begin
Halvsies

Write a method that takes an Array as an argument,
and returns two Arrays that contain the first half and second half
of the original Array, respectively.
If the original array contains an odd number of elements,
the middle element should be placed in the first half Array.

input
  array
output
  two arrays that contain the first half and second half respectively
rules
  if there is an odd number of elements the middle should be put in the first
  half of the array

given an array
  seperate the arrays into halves
    divide the length of the first array by two, if there is a remainder
    add one to the variable
    save from 0 to n –defined above– into the first arr
    save the second half into the second arr
    iterate until reaching n
      each iterate pop an element from inputted arr into new arr

    return two arrays
=end

def halvsies(arr)
  first_half = []
  arr.length.odd? ? n = (arr.length / 2) + 1 : n = arr.length / 2
  n.times do |i|
    first_half << arr[i]
    arr.delete_at(i)
  end
  p [first_half, arr]
end

# Examples:
halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]
