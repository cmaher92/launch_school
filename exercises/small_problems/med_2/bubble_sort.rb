# Bubble sort

#Bubble Sort is one of the simplest sorting algorithms available.
#It isn't an efficient algorithm, but it's a great exercise for student
#developers.
#In this exercise, you will write a method that does a bubble sort of an Array.


#A bubble sort works by making multiple passes (iterations) through the Array.
#On each pass, each pair of consecutive elements is compared.
#If the first of the two elements is greater than the second,
#then the two elements are swapped.
#This process is repeated until a complete pass is made without performing
#any swaps; at that point, the Array is completely sorted.

# input
#   Array to be sorted
# output
#   Sorted array
# rules
#   elements compared are consecutive

# - given an array to be sorted
# - create a local variable 'swapped' and set to false
# - repeat sorting until the swapped variable is false
# this means that the sort will occur over and over again until
# all objects in the array arr sorted and no more swaps are needed
#   I. sort from 1 to length - 1 pass local variable i into block
#     i. if A[i-1] > A[i], swap, set swapped to true
#     ii. otherwise, continue
# - Once the sorting loop has completed, break outer loop if swapped = false
# - Return array that has been changed

def bubble_sort!(a)
  swapped = false
  loop do
    1.upto(a.length - 1) do |i|
      if a[i-1] > a[i]
        a[i-1], a[i] = a[i], a[i-1]
        swapped = true
      end
    end
    break if swapped == false
    swapped = false
  end
  a
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
