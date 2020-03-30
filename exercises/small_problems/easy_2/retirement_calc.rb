# When will I Retire?
# Build a program that displays when the user will retire 
# and how many years she has to work till retirement.

# - Input:
#   - Integer: user-input
#   - Integer: user-input
# - Output:
#   - String: printed to output
# - Rules:
# - Data structure:
#   - Integers, for basic calculation
# - Algorithm:
#   - retrieve user age and convert to Integer
#   - retrieve user age that they want to retire
#   - calculate years_left between current_age and retirement_age
#   - retrieve the current year from the Time class
#   - calculate retirement_year by adding years_left to current_year
#   - output String displaying current year, retirement year, and years_left

def calc_retirement
  puts "<< What is your age?\n"
  age = gets.chomp.to_i
  puts "<< At what age would you like to retire?\n"
  retirement_age = gets.chomp.to_i

  year = Time.now.year
  years_left = retirement_age - age
  retirement_year = year + years_left

  puts "It's #{year}. You will retire in #{retirement_year}."
  puts "You have only #{years_left} years of work to go!"
end

calc_retirement


# - Examples
# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!