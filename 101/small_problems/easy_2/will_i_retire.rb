# will i retire

# Build a program that displays when the user will retire and how many years 
# she has to work till retirement.

# Example
# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

# understanding the problem
# input
#   age: user-inputted string
#   retire_age: user-inputted string
# output:
#   prints out current year, the year you will retire, and the difference

# algorithm
# calculate current year
#   Time#new
# calculate the year she will retire
#   retire_age - age added to the current year
# calculate years left of work
#   retire_age - age

def will_i_retire
    puts "What is your age?"
    age = gets.chomp.to_i
    
    puts "At what age would you like to retire?"
    retire_age = gets.chomp.to_i
    
    current_year    = Time.now.year
    years_left      = retire_age - age
    retirement_year = current_year + years_left
    
    puts "It's #{current_year} You will retire in #{retirement_year}."
    puts "You have only #{years_left} years of work to go!"
end

will_i_retire
