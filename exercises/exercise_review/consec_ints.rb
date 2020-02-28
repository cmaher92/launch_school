# Sum or Product of Consecutive Integers

# Write a program that asks the user to enter an integer greater than 0,
# then asks if the user wants to determine the sum or product of all numbers
# between 1 and the entered integer.

# ask user for number greater than 0
# create array from 1.. number user entered
# ask the user if they want the sum or product
# return the sum or the product

def consec_ints
  puts ">> Please enter an integer greater than 0:"
  num = gets.chomp.to_i
  arr = Array.new(num) { |i| i + 1 }
  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  method = gets.chomp.downcase
  if method == 's'
    puts "#{arr.reduce(&:+)}"
  else
    puts "#{arr.reduce(&:*)}"
  end
end

consec_ints

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
