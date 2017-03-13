# Question 3

puts 'please enter a number'
number = gets.chomp.to_i
current_number = 0

while current_number < number
  puts current_number
  current_number += 1
end
