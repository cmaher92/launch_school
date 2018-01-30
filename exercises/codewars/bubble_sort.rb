# Bubble Sort

# Bubble Sort is one of the simplest sorting algorithms available. 
# It isn't an efficient algorithm, but it's a great exercise for student
# developers. In this exercise, you will write a method that does a bubble sort
# on an Array. 

# A bubble sort works by making multiple passes (iterations) through the Array.
# On each pass, each pair of consecutive elements is compared. If the first
# of the two elements is greater than the second, then the two elements are
# swapped. This process is repeated until a complete pass is made without 
# performing any swaps; at that point, the Array is completely sorted. 

# input
#   Array of unsorted objects 
# output
#   Array of sorted integers
# rules
#   Array will contain at least two elements
#   

# Iterate through the array until
  # compare two elements 
  # if the first element is less than the second element
  #   swap
  #   set swap_made to true 
  # otherwise
  #   continue iterating
  
# this iteration must loop until swap_made is false
# this must also be able to handle strings

# algorithm
# loop
# set swap_made to false

  # loop over the array
  # set counter to 1
    # compare element at the counter and one before the counter
    # if first element is less than second element
      # swap & set swap_made to true
      # counter += 1
    # else
      # continue iterating
      # counter += 1
      
 # break loop if swap_made == false
# return array
require 'pry'

# Initial attempt
# def bubble_sort!(array)
#   loop do
#     swap_made = false
#     counter = 1
#     loop do
#       if (array[counter - 1] <=> array[counter]) == 1
#         array[counter - 1], array[counter] = array[counter], array[counter - 1]
#         swap_made = true
#         counter += 1
#       else
#         counter += 1
#       end
#       break if counter >= array.size
#     end
#     break if swap_made == false
#   end 
#   array
# end 

# possible improvements
  # I shouldn't have to iterate over a piece of the array I already know is 
  # sorted
  
  # With each 'pass' which means that a complete iteration has been done
  # The largest variable is sorted to the end first
  # [3, 2, 1] -> [2, 1, 3]
  # Then after the second pass the second-largest variable is sorted
  # [2, 1, 3] -> [1, 2, 3]
  
  # meaning that after each complete pass you don't have to iterate over the
  # last variable and can iterate over one less variable each time
  
# understanding further exploration
# loop, each completion represents a pass
#   swapped = false
#   n = length of the array
#   iterate from 0 upto n - 1
  # next iteration if 1 is not returned by comparing the first and second elements
  # swap the elements
  # set swapped to true

# break if swapped == false
# subtract 1 from n

# algorithm
def bubble_sort!(array)
  n = array.length
  
  loop do
    swapped = false 
    
    1.upto(n - 1) do |index|
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end
  
    break unless swapped
    n -= 1
  end

  p array
end 
# Test cases
array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)