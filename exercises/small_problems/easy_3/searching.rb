# Searching 101
#
# Write a program that solicits 6 numbers from the user, then prints a message
# that describes whether or not the 6th number appears amongst the first 5
# numbers.

# input
#   string: user inputted, 6 of them
# output
#   string: letting the user know if the sixth num is in the first 5

# create an array
# ask the user for numbers
# get the numbers from user
# place each input from the user into the newly created array

inputs = Array.new
has_last = false
puts "Enter the 1st number:"
inputs << gets.chomp
puts "Enter the 2nd number:"
inputs << gets.chomp
puts "Enter the 3rd number:"
inputs << gets.chomp
puts "Enter the 4th number:"
inputs << gets.chomp
puts "Enter the 5th number:"
inputs << gets.chomp
puts "Enter the 6th number:"
last = gets.chomp

if inputs.include?(last)
  puts "The number #{last} appears in #{inputs.inspect}."
else
  puts "The number #{last} does not appear in #{inputs.inspect}."
end


#
# Examples:
# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].
