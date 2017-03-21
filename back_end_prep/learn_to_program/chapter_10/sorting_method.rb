# Sorting method

# Take unsorted_words, find smallest word
# stick smallest word at end of the sorted_words
# All of the other words go back into the unsorted_words list
# instead of original list
require 'pry'

orig_array = %w( cat dog elf frog giraffe cat xylephone pants fred kyle simpson )

def sort_words!(original_array)
  unsorted_words = original_array
  sorted_words = []
  while unsorted_words.length != 0
    current_smallest = unsorted_words[0]
    current_index = 0
    unsorted_words.each_with_index do |word, index|
      if word <= current_smallest
        current_smallest = word
        current_index = index
      end
    end
    sorted_words << current_smallest
    unsorted_words.delete_at(current_index)
  end
  return sorted_words
end

p sort_words!(orig_array)

# How he did it
def sort(arr)
  rec_sort (arr, [])
end

def rec_sort(unsorted, sorted)
  if unsorted.length <= 0
    return sorted
  end

  # So if we got here, then it means we still have sorting to do
  smallest = unsorted.pop
  still_unsorted = []
  unsorted.each do |tested_object|
    if tested_object < smallest
      still_unsorted.push smallest
      smallest = tested_object
    else
      still_unsorted.push tested_object
    end
  end
  # now smallest really does point to the smallest element that
  # 'unsorted' contained, and all the rest of it is in 'still_unsorted'
  sorted.push smallest
  rec_sort(still_unsorted, sorted)
end
