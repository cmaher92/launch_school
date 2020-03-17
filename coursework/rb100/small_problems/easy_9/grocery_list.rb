# Grocery list

# Write a method which takes a grocery list (array) of fruits with quantities
# and converts it into an array of the correct number of each fruit

# input
#   array of arrays [fruit, num_of_fruit]
# output
#   array of strings, each string is a fruit based on the num for each fruit

# given a list of fruits and the number of fruits
# init an array
# map each subarray
#   subarr[1].do { |num| arr << subarr[0] }
# return new arr

def buy_fruit(fruits)
  arr = []
  fruits.each do |subarr|
    subarr[1].times { arr << subarr[0] }
  end
  p arr
end
  
  p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]