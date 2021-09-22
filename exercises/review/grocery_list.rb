# grocery_list.rb

# IO
# < list (array)
#   - list_item (array)
#     - item (string), qty (int)
# > grocery_list (array)
#   - strings

# RULES

# ALGORITHM
# 1. define a new empty array as grocery_list
# 2. iterate over list, defining block parameters item and qty
# 3. - add the item to the previously defined grocery_list qty times
# 4. return grocery_list

def buy_fruit(list)
  grocery_list = []
  list.each do |item, qty|
    qty.times { grocery_list << item }
  end
  grocery_list
end

# EXAMPLES
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
