# Exercise 6
# Ruby Basics

# Write a program that calculates the squares of 3 float numbers of your choosing and outputs the result to the screen
numbers = []
puts "please choose a number"
number = gets.chomp
numbers << number.to_f
puts "please choose another number"
number = gets.chomp
numbers << number.to_f
puts "please choose your last number"
number = gets.chomp
numbers << number.to_f

def calculate_the_squares numbers_array
  numbers_array.each do |number|
    puts number*number
  end
end

calculate_the_squares numbers
