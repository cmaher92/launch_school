# Arithmetic Integer
#
# Write a program that prompts the user for two positive integers, and then
# prints the results of the following operations on those two numbers:
# addition, subtraction, product, quotient, remainder, and power.
# Do not worry about validating the input.
#
# input
#   ints: 2 positive integers
# output
#   string
#     addition
#     subtraction
#     product
#     quotient
#     remainder
#     power
# rules
#   don't validate input

puts "Enter the first number:"
num = gets.chomp.to_i
puts "Enter the second number:"
num2 = gets.chomp.to_i

puts "#{num} + #{num2} = #{num + num2}"
puts "#{num} - #{num2} = #{num - num2}"
puts "#{num} * #{num2} = #{num * num2}"
puts "#{num} / #{num2} = #{num / num2}"
puts "#{num} % #{num2} = #{num % num2}"
puts "#{num} ** #{num2} = #{num ** num2}"

# What if we used floats instead of integers?
# validate that the second number isn't 0

def validate?(num)
  if num == 0
    return false
  end
end

#
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
