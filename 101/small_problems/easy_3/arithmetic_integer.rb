# arithmetic integer

# Write a program that prompts the user for two positive integers, and then prints 
# the results of the following operations on those two numbers: addition, 
# subtraction, product, quotient, remainder, and power. Do not worry about 
# validating the input.

# Example
# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103

# understanding
# input
#   two numbers entered by user
# output
#   print results of the two numbers being added, subtracted, multiplied,
#   divided, modulos, and power

# algorithm
# retrieve numbers
# print addition
# print subtraction
# print multiplication
# print division
# print using the modulo
# print the power of

puts "Enter the first number:"
num1 = gets.chomp.to_i
puts "Enter the second number:"
num2 = gets.chomp.to_i

puts "#{num1} + #{num2} = #{num1 +   num2}"
puts "#{num1} - #{num2} = #{num1 -   num2}"
puts "#{num1} * #{num2} = #{num1 *   num2}"
puts "#{num1} / #{num2} = #{num1 /   num2}"
puts "#{num1} % #{num2} = #{num1 %   num2}"
puts "#{num1} ** #{num2} = #{num1 ** num2}"