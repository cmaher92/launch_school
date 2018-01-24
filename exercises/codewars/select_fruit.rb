produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

# given a hash
# select only the fruit
# return the select fruit in a hash

def select_fruit(produce)
  produce.select { |k, v| v == "Fruit" }
end

p select_fruit(produce)
