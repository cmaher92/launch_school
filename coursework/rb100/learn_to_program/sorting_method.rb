# sorting method
require "pry"

unsorted_words = ["john", "connor", "avery", "megan", "cassie"]

def sorting_function unsorted_words
  sorted_words = []
  currently_smallest_word = ""
  while unsorted_words.length > 0
    unsorted_words.each do |word|
      if currently_smallest_word == ""
        currently_smallest_word = word
      end
      if currently_smallest_word > word
        currently_smallest_word = word
      end
    end
    sorted_words << currently_smallest_word
    unsorted_words.delete(currently_smallest_word)
    currently_smallest_word = ""
  end
  return sorted_words
end

sorted_words = sorting_function unsorted_words
puts sorted_words
