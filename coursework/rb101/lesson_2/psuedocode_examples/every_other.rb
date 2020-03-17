
# Given an collection of integers

# Iterate through the collection one by one.
# - if the value's index position is even save to new array
# - otherwise, move to the next value of the collection
#
# return the array

# START
#
# SET new_array as an empty array
# WHILE iterating through array with the item and it's index
#   IF index is even
#     add item to new_array
#
# PRINT new_array
#
# END

def every_other(array)

  new_array = Array.new
  array.each_with_index do |item, index|
    if index.even?
      new_array << item
    end
  end

  return new_array
end

puts every_other(%w(1 2 3 4 5 6 7 8))
