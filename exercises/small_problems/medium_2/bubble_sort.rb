# bubble sort
# medium 2, problem 9

# A bubble sort works by making multiple passes through an array
# on each pass, each pair of consecutive elements is compared
# if the first element is greater than the second, they are swapped
# repeated until no more swaps are made

# input: array
# output: array; sorted
# rules:
# - in-place
# - contains at least two elements

# algorithm:
# - loop over array until no swaps are made
# - check swap_made after each pass, break if false, continue if true
# - set to false prior to inner-loop
#   - loop over array, 

def bubble_sort!(array)
  n = array.size
  
  loop do
    swap_made = false

    (1..n).each do |idx|
      if (array[idx - 1] <=> array[idx]) == 1
        array[idx - 1], array[idx] = array[idx], array[idx - 1]
        swap_made = true
      end
    end

    n -= 1

    break if swap_made == false
  end

  array
end

# improvement from wiki
# the nth pass finds the nth largest item and places it in it's proper place
# so each subsequent iteration doesn't need to look at the entire array, just the ones that haven't been sorted

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

