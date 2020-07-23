# The application lets a customer place an order for a meal.
# A meal always has three meal items: a burger, a side, and drink.
# For each meal item, the customer must choose an option.
# The application must compute the total cost of the order.

# nouns
#   - customer
#   - order
#   - meal
#   - item
#     - burger
#     - side
#    - drink

# verbs
#   - place_order
#   - choose_option for each item
#   - compute_cost

class Customer; end

class Order; end

class MealItem; end

class Burger < MealItem
  OPTIONS = {
    '1' => { name: 'LS Burger', cost: 3.00 },
    '2' => { name: 'LS Cheeseburger', cost: 3.50 },
    '3' => { name: 'LS Chicken Burger', cost: 4.50 },
    '4' => { name: 'LS Double Deluxe Burger', cost: 6.00 }
  }
end

class Side < MealItem
  OPTIONS = {
    '1' => { name: 'Fries', cost: 0.99 },
    '2' => { name: 'Onion Rings', cost: 1.50 }
  }
end

class Drink < MealItem
  OPTIONS = {
    '1' => { name: 'Cola', cost: 1.50 },
    '2' => { name: 'Lemonade', cost: 1.50 },
    '3' => { name: 'Vanilla Shake', cost: 2.00 },
    '4' => { name: 'Chocolate Shake', cost: 2.00 },
    '5' => { name: 'Strawberry Shake', cost: 2.00 }
  }
end
