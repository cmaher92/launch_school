unsorted_array = %w( dog elf frog giraffe cat cat )

require 'pry'

def sort(some_array)
  rec_sort(some_array, [])
end
def rec_sort(unsorted_array, sorted_array)
  # check to see if unsorted <= 0, if it does return sorted
  if unsorted_array.length <= 0
    return sorted_array
  end

  # set smallest to any object popped from the unsorted_array
  smallest = unsorted_array.pop
  # create a still_unsorted array
  still_unsorted = []
  # iterate over the unsorted
  unsorted_array.each do |tested_object|
    if tested_object < smallest
      still_unsorted.push smallest
      smallest = tested_object
    else
      still_unsorted.push tested_object
    end
  end

  sorted_array.push smallest
  rec_sort(still_unsorted, sorted_array)
end

p sort(unsorted_array)
