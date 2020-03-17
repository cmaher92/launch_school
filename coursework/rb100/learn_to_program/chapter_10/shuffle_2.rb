# Shuffle another way

arr = %w( dad con meg ave mom )

def shuffle(arr)
  shuf = []

  while arr.length > 0
    rand_index = rand(arr.length) # This is how to chose a random item by it's index
    curr_index = 0
    new_arr = [] # This will hold the smaller arr
    arr.each do |item|
      if curr_index == rand_index
        shuf.push item
      else
        new_arr.push item
      end
      curr_index += 1
    end
    arr = new_arr
  end
  return shuf
end

p shuffle(arr)
