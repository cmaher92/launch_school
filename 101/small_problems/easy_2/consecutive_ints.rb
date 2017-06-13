# consecutive integers

# Write a program that asks the user to enter an integer greater than 0, 
# then asks if the user wants to determine the sum or product of all numbers
# between 1 and the entered integer.

# Examples:
# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.


# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

# understanding the problem
# input
#   integer greater than zero
# output
#   print either the sum or the product of all numbers between 1 and the input

# algorithm
# retrieve number from user
# retrieve if the user wants sum or product calculated
# create an array based on a range from (1..num)
# calculate the sum
#   add all of the items in the array together
# calculate the product
#   multiply all of the items in the array together

puts "Please enter an integer greater than 0:"
num = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product"
choice = gets.chomp

numbers = (1..num).to_a

if choice == 's'
    puts "The sum of the numbers between 1 and #{num} is #{numbers.reduce(0, :+)}."
else
    puts "The product of the numbers between 1 and #{num} is #{numbers.reduce(1, :*)}."
end