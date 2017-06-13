# how big is the room

# Build a program that asks a user for the length and width of a room in meters 
# and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# Example
# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

# understanding the problem
# input
#   user-input
        # asks for the length and width of the room in meters
# output
#   displays the area of the room in both sq. meters and sq. ft.

# algorithm
# calculate the sq. feet
#     sq. meters * 10.7639
# calculate the sq. meters
#     length * width ->  float

def how_big_is_room
    puts 'Enter the length of the room in meters:'
    length = gets.chomp
    puts 'Enter the width of the room in meters:'
    width = gets.chomp
    puts "The area of the room is #{length.to_f * width.to_f} square meters (#{(length.to_f * width.to_f) * 10.7639} square feet)."
end

how_big_is_room
