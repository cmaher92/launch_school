# Shuffle
# Takes an array and returns a totally shuffle version

# Issues:
# Currently if I were to remove .compact in the return statement it will contain nil's randomly throughout the array


require 'pry'

def shuffle(arr)
  rec_shuffle(arr, [])
end
def rec_shuffle(unshuffled, shuffled)
  if unshuffled.length <= 0
    return shuffled
  end

  # if we get here it still has shuffling to do
  still_unshuffled = []
  # Grab a random number that is the length of the unshuffled array
  index = rand(unshuffled.length)

  # check to see if there is even an element at that index
  # grab that element from the randomly selected index
  shuffled.push unshuffled[index]
  # put all of the elements that aren't unshuffled[index] into still_unshuffled
  still_unshuffled = unshuffled.select do |tested_object|
    tested_object != unshuffled[index]
  end

  rec_shuffle(still_unshuffled, shuffled)
end

def shuffle_test
  arr = %w( cat dog fred connor avery megan maher kyle )
  cat = { 0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 0 }

  1000.times do
    current_array = shuffle(arr)
    current_array.each do |item|
      if item == 'cat'
        # binding.pry
        item_index = current_array.index('cat')
        cat[item_index] += 1
      end
    end
  end
  p cat
end

shuffle_test
