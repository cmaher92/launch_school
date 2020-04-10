require 'pry'

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def find_pairs_by_value(hash, value)
  selected_pairs = {}
  counter = 0
  keys = hash.keys

  loop do
    break if counter == keys.length
    key = keys[counter]
    if hash[key] == value
      selected_pairs[key] = value
    end
    counter += 1
  end

  selected_pairs
end

p find_pairs_by_value(produce, 'Fruit')
p find_pairs_by_value({}, 'Vegetable')
