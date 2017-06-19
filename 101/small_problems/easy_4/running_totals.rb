# running totals

# Write a method that takes an Array of numbers, and returns an Array with the 
# same number of elements, and each element has the running total from the 
# original Array.

# understanding
# input
#   array of numbers
# output
#   return an array with the same number of elements, and each element has
#   the running total from the original array

# algorithm
# create running_total array
# create current_element which starts at 1
# while the length of the running_total is less then the length of the given
# array
#   running_total << array[0..current_element].reduce(:+)
#   current_element += 1
# return running_total array

# solution
# def running_total(arr)
#     running_total = []
#     current_element = 0
#     while running_total.length < arr.length
#         running_total << arr[0..current_element].reduce(:+)
#         current_element += 1
#     end
#     p running_total
# end

# given solution
def running_total(arr)
    sum = 0
    arr.map { |value| sum += value }
end 

# test cases
puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []