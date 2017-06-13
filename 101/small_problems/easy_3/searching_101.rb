# searching_101.rb

# Write a program that solicits 6 numbers from the user,
# then prints a message that describes whether or not the 6th number appears
# amongst the first 5 numbers

# understanding
# input
#   6 integers retrieved from user
# output
#   print the last number retrieved from the user and whether or not it is 
#   in the array of the first five numbers

# algorithm
# retrieve six numbers from user and combine first five into array
# check the array for the sixth num
#   Array#include?
# if array contains number
#   print out the output describing that the number is present
# if not
#   print out that the number is not present

puts "Enter the 1st number:"
num1 = gets.chomp.to_i

puts "Enter the 2nd number:"
num2 = gets.chomp.to_i

puts "Enter the 3rd number:"
num3 = gets.chomp.to_i

puts "Enter the 4th number:"
num4 = gets.chomp.to_i

puts "Enter the 5th number:"
num5 = gets.chomp.to_i

puts "Enter the 6th number:"
num6 = gets.chomp.to_i

first_five_nums = [num1, num2, num3, num4, num5]

if first_five_nums.include?(num6)
    puts "The number #{num6} appears in #{first_five_nums}."
else
    puts "The number #{num6} does not appear in #{first_five_nums}."
end

