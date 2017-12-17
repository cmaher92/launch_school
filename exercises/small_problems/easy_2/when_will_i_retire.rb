# When will I Retire?

# Build a program that displays when the user will retire and how many years 
# she has to work till retirement.

# - get user's age
# - get age that user will retire
# - calculate what year user will retire and print
# - calculate how many years left and print

puts "What is your age?"
age = gets.chomp.to_i
puts "At what age would you like to retire?"
retirement = gets.chomp.to_i
current_year = 2017

puts "
It's #{current_year}. You will retire in #{current_year + (retirement - age)}"
puts "You only have #{retirement - age} years of work to go!"


# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!
