# Sum or Product of Consecutive Integers

# Write a program that asks the user to enter an integer greater than 0,
# then asks if the user wants to determine the sum or product of all numbers
# between 1 and the entered integer.

# - ask the user for an integer greater than 0
# - ask if the user wants the sum or product between 1 and his entered num
# - create array beginning at 1 and ending at the num entered
# - if sum
#   - calculate sum
#     - sum all ints in the array
# - else product
#   - calculate product
#     - multiply all nums together in the array 

puts "Please enter an integer greater than 0"
num = gets.chomp
puts "Would you like to sum or multiply all numbers from 1 to #{num}?"
puts "Please enter either: 'sum' or 'product'"
calculation = gets.chomp
array = Array.new(num.to_i) { |i| i + 1 }
if calculation.downcase == "sum"
  result = array.inject(:+)
else 
  result = array.inject(:*)
end
puts result

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
