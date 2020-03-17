# How old is Teddy?

# Build a program that randomly generates and prints Teddy's age. 
# To get the age, you should generate a random number between 20 and 200.

# - age = generate random number between 20 and 200
#   - create an array with the range of (20..200)
#   - randomly select a number within the array
#   - set as age
# - print teddy's age

arr = Array(21...200)
age = arr.sample
puts "Teddy is #{age} years old!"

# Example Output
# Teddy is 69 years old!
