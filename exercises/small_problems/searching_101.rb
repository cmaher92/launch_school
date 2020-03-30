# Searching 101
# Write a program that solicits 6 numbers from the user, 
# then prints a message that describes whether or not 
# the 6th number appears amongst the first 5 number

# - Input:
#   - String, 6, user-input asking for a number
# - Output:
#   - String, answers if the last entered number appears in the first 5
# - Rules:
#   - suffix for asking user
#   - 1st, 2nd, 3rd, 4th, 5th, 6th
# - Data Structure:
#   - Array, to see hold the user entered numbers
#   - loop, to ask for a number 6 times
#     - break when the array is at 6
# - Abstraction:
#   - ask the user for a number 6 times
#   - check to see if the number was present in the first 5
#   - add suffix based on the question number
# - Algorithm:
#   - create an array
#   - loop, asking user to enter a number
#     - break when the arrays length is 6
#   - pop the last number from the array and check if present
#   - output to user

map_suffix = { 1 => '1st', 2 => '2nd', 3 => '3rd', 4 => '4th', 5 => '5th', 6 => 'last' }
responses = []
question_number = 1
loop do
  break if responses.size == 6
  suffix = map_suffix[question_number]
  puts "==> Enter the #{suffix} number"
  responses << gets.chomp.to_i
  question_number += 1
end
last_num = responses.pop
appears = responses.include?(last_num) ? "appears" : "does not appear"
puts "The number #{last_num} #{appears} in #{responses}."