# How old is Teddy?
# Build a program that randomly generates and prints Teddy's age. 
# To get the age, you should generate a random number between 20 and 200.

# Example Output
# Teddy is 69 years old!

# - Input:
# - Output:
#   - String: prints out a sentence with a random number between 20, 200
# - Rules:
#   - output must be between 20, 200
#   - not sure whether 20, or 200 is allowed are these included or excluded

# - Data Structure:
# - Algorithm:
#   - define a range
#   - turn range to an array
#   - sample random number
#   - print sentence with the sampled number as his age
require 'pry'

def announce_age(name="Teddy")
  puts "<< Who's name would you like make a birtday annoucement for?"
  result = gets.chomp 
  result == "" ? name = name : name = result
  puts "#{name} is #{rand(20..200)} years old!"
end

announce_age #=> 'Teddy is 69 years old!'