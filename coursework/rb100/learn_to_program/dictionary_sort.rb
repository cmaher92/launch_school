# Dictionary sort

# Make a method to sort words that sort regardless of the presence of
# capital letters

# Note:
# Could abstract some of this into multiple functions, there is a lot of logic
# for a single function

require 'Pry'

unsorted_array = ["Connor", "michael", "Maher", "john"]

def dictionary_sort unsorted_array
  sorted_array = []
  sorted_array_downcased = []
  capitalized_items = []
  unsorted_array_downcased = []
  currently_smallest_word = ""
  unsorted_array.each do |item|
    if item == item.capitalize
      capitalized_items << item.downcase
      unsorted_array_downcased << item.downcase
    else
      unsorted_array_downcased << item.downcase
    end
  end
  puts unsorted_array_downcased.join(',')
  puts capitalized_items.join(',')
  # sort the unsorted_array_downcased
  while unsorted_array_downcased.length > 0
    unsorted_array_downcased.each do |item|
      if currently_smallest_word == ""
        currently_smallest_word = item
      end
      if currently_smallest_word > item
        currently_smallest_word = item
      end
    end
    sorted_array_downcased << currently_smallest_word
    unsorted_array_downcased.delete(currently_smallest_word)
    currently_smallest_word = ""
  end
  puts sorted_array_downcased.join(",")
  # capitalize the items in the unsorted_array_downcased based on the
  # capitalized items array
  sorted_array_downcased.each do |item|
    # check each item against the capitalized_items array
    if capitalized_items.include?(item) == true
      sorted_array << item.capitalize
    elsif
      sorted_array << item
    end
  end
  puts sorted_array.join(',')
end

dictionary_sort unsorted_array
