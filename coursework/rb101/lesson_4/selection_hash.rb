produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce)
    fruit = produce.keys
    counter = 0
    selected = {}

    loop do
        # in case 'produce' is an empty hash
        break if counter == fruit.size

        current_key   = fruit[counter]
        current_value = produce[current_key]

        if current_value == 'Fruit'
            selected[current_key] = current_value
        end

        counter += 1
    end

    selected
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}