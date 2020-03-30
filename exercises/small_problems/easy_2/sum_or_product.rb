# sum or product
# small_problems/easy_2

# Write a program that asks the user to enter an integer greater than 0, 
# then asks if the user wants to determine the sum or product 
# of all numbers between 1 and the entered integer.

# - Input:
#   - Integer, greater than 0
# - Output:
#   - String, outputted to user
# - Rules:
#   - need to generate an array from 1 - n
# - Data Structure:
#   - Array, can easily generate all numbers from 1 to n
# - Abstraction:
#   - generate array based on users input
#   - find the sum or the product
#   - output to the user
# - Algorithm:
#   - generate an array using [*1..n]
#   - response is either the reduce array passing in :+ or :* based on user response
#   - use ternary operator to determine which to pass in to reduce method
#   - reduce the array
#   - interpolate into string

puts ">> Please enter an integer greater than 0:"
n = gets.chomp.to_i
puts "Enter 's' to computer the sum, 'p' to compute the product."
method = gets.chomp.include?('s') ? :+ : :*
result = [*1..n].reduce(method)
puts "The #{method == :* ? 'product' : 'sum'} of the integers between 1 and 6 is #{result}"

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