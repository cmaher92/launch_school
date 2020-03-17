# recursive sort
# create function that sorts array recursively

require "pry"

unsorted_words = ["john", "connor", "connor", "avery", "megan", "cassie", "cassie"]

def recursive_sort unsorted_array, sorted_array
  smallest_word = ""
  if unsorted_array.empty?
    return sorted_array
  else
    unsorted_array.each do |word|
      if smallest_word == ""
        smallest_word = word
      end
      if word < smallest_word
        smallest_word = word
      end
    end
    sorted_array << smallest_word
    # To prevent removing repeated words in the sorted array
    smallest_word_index = unsorted_array.find_index(smallest_word)
    unsorted_array.slice!(smallest_word_index)
    recursive_sort unsorted_array, sorted_array
  end
end

def sort some_array
  recursive_sort some_array, []
end

sort unsorted_words
sorted_words_array = unsorted_words.sort
puts unsorted_words == sorted_words_array
