# Odd Lists
#
# Write a method that returns an Array that contains every other element of an
# Array that is passed in as an argument. The values in the returned list should
# be those values that are in the 1st, 3rd, 5th, and so on elements of the
# argument Array.

# input
#   array
# output
#   array
#
# remove the odd index items from collection

# def oddities(arr)
#   oddities = Array.new
#   arr.each_with_index do |item, index|
#     if index.even?
#       oddities << item
#     end
#   end
#   oddities
# end

 # Write a companion method that returns the 2nd, 4th, 6th, and so on elements of an array.
 # set new array
 # set index to 0
 # for item in array
 #  new_array << array[index]
 # return new_array

 # def evens(arr)
 #  evens = Array.new
 #  index = 1
 #  while index < arr.length
 #    evens << arr[index]
 #    index += 2
 #  end
 #  evens
 # end

 # given a collection
 # index
 # while the index is less than the length of the collection
  # delete the item
  # increment index
 # return a collection that is just the 2nd, 4th etc. elements

 # def oddities(arr, idx)
 #   if idx < arr.length
 #     arr.delete_at(idx)
 #     idx += 1
 #     oddities(arr, idx)
 #   else
 #     return arr
 #   end
 # end

# try without looping
# 

def oddities(arr)
end

# Examples:
puts oddities([2, 3, 4, 5, 6])# == [2, 4, 6]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []
# puts evens([2, 3, 4, 5, 6]) == [3, 5]
