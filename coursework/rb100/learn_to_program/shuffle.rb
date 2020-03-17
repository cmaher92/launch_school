# Shuffle

# Write a shuffle method that takes an array and returns a totally
# shuffled array

require 'Pry'

unshuffled_array = [5, 3, 2, 1]

def shuffle unshuffled_array
  shuffled_array = []
  length_int = unshuffled_array.length
  unshuffled_array.each do |item|
    random_number = rand(unshuffled_array.length)
    while shuffled_array[random_number] != nil
      random_number = rand(unshuffled_array.length)
    end
    shuffled_array[random_number] = item
  end
  return shuffled_array
end

def test_shuffle unshuffled_array
  same = 0
  count = 0
  shuffled_array = shuffle unshuffled_array
  unshuffled_array.each do |item|
    if item == shuffled_array[count]
      same += 1
      count += 1
    else
      count += 1
    end
  end
  puts "unshuffled array: " + unshuffled_array.join(',')
  puts "shuffled array: " + shuffled_array.join(',')
  puts "same: " + same.to_s
  puts "count: " + count.to_s
  # percentage = (same / count) * 100
  # return "Difference between unshuffled and shuffled: " + percentage.to_s
end

# To test just how random the shuffle is I could run the shuffle x number of
# times and tally each time I have 1, 2, 3, or 4 similar numbers

puts test_shuffle unshuffled_array
