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

def prompt(message)
  puts "==> #{message}"
end

def validate(num)
  num != 0
end

prompt("Enter the first number:")
num = gets.chomp.to_f

validated = false
until validated
  prompt("Enter the second number:")
  num2 = gets.chomp.to_f
  validated = validate(num2)
end


prompt("#{num} + #{num2} = #{num + num2}")
prompt("#{num} - #{num2} = #{num - num2}")
prompt("#{num} * #{num2} = #{num * num2}")
prompt("#{num} / #{num2} = #{num / num2}")
prompt("#{num} % #{num2} = #{num % num2}")
prompt("#{num} ** #{num2} = #{num ** num2}")

# What if we used floats instead of integers?

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
