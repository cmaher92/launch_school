# When will I Retire?

# Build a program that displays when the user will retire and how many years
# she has to work till retirement.

puts "What is your age?"
age = gets.chomp.to_i
puts "At what age would you like to retire?"
goal_age = gets.chomp.to_i

current_year = Time.new.year
retirement_year = current_year + (goal_age - age)

puts "It's #{current_year}. You will retire in #{retirement_year}."
puts "You only have #{retirement_year - current_year} years of work to go!"

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!
