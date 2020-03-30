# Arithmetic Integer
# Write a program that prompts the user for two positive integers, 
# and then prints the results of the following operations on those two numbers: 
# addition, subtraction, product, quotient, remainder, and power. 
# Do not worry about validating the input.

# - Input:
#   - Integer, 2, user-input
# - Output:
#   - 6 strings, containing 1st integer, 2nd integer and result
# - Rules:
# - Data Structure:
#   - arr to hold 6 copies of each number pair
#   - can use reduce and map
# - Abstraction:
#   - create array containing each operation [:+, :-, :*, ...]
#   - create array containing numbers inputted by user [num_1, num_2]
#   - map operation array, to the result string
#     - :* => "#{arr[0]} #{operation} #{arr[1]} = #{arr.reduce(operation)}"
#   - print out each item of the operation array



def retrieve_numbers
  nums = []
  %w[first second].each do |num|
    puts "==> Enter the #{num} number:"
    nums << gets.chomp.to_i
  end 
  nums
end

nums = retrieve_numbers
operations = %i(+ - * / % **)
operations.each do |operation|
  puts "==> #{nums[0]} #{operation} #{nums[1]} = #{nums.reduce(operation)}"
end

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