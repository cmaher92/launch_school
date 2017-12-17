# How big is the room?

# Build a program that asks a user for the length and width of a room in meters
# and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# - gets length of room
# - gets width of room
# - calculate area in sq. feet 
# - calculate area in sq. meters

puts "Enter the length of the room in meters:"
length = gets.chomp
puts "Enter the width of the room in meters:"
width = gets.chomp
puts "
The area of the room is #{length.to_i * width.to_i} square meters (#{(
length.to_i * width.to_i) * 10.7639} square feet)."

# Example Run
# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).
