# Countdown
# Ruby Loops and Iterators

# Countdown from any number given by the user and print to the screen each number it counts

puts 'Please enter a number'
number = gets.chomp
number = number.to_i

while number > 0
	puts number
	number = number - 1
end

puts 'done'
