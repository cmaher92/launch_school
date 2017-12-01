=begin
  Given an array of numbers find if any 3 numbers inside of the array
  can be multiplied to get the maximum number in the array.
  If the number is used once it can't be used again. If there are two same numbers
  then that number can be used 2 times.
=end

# given an array of numbers
#   n = find the largest number in the array
#   find three numbers within the array that will equal the largest num in the array
#     for each number in the array
#       take the number and multiply by
#
#   numbers can't be repeated unless there are more than one number


# p mult_of_three_nums([1,2,3,4,5,6]) == true
# p mult_of_three_nums([3, 8, 0, 9, 4, 2, 7]) == false
# p mult_of_three_nums([5, 3, 7, 9, 2, 51, 90]) == true
# p mult_of_three_nums([1, 1, 5, 7, 987, 3, 2]) == true
# p mult_of_three_nums([2, 5, 8, 11, 32, 2]) == true
# p mult_of_three_nums([13, 3, 11, 56, 79, 2]) == false

# another solution
# def mult_of_three_nums(arr)
#   arr.combination(3).to_a.each do |subarr|
#     return true if subarr.reduce(:*) == arr.max
#   end
#   false
# end



# p mult_of_three_nums([1,2,3,4,5,6]) == true
# p mult_of_three_nums([3, 8, 0, 9, 4, 2, 7]) == false
# p mult_of_three_nums([5, 3, 7, 9, 2, 51, 90]) == true
# p mult_of_three_nums([1, 1, 5, 7, 987, 3, 2]) == true
# p mult_of_three_nums([2, 5, 8, 11, 32, 2]) == true
# p mult_of_three_nums([13, 3, 11, 56, 79, 2]) == false
