# # How big is the room?
# # Build a program that asks a user for the length and width of a room in meters 
# # and then displays the area of the room in both square meters and square feet

# # Note: 1 square meter == 10.7639 square feet
# # Do not worry about validating the input at this time.

# - Input:
#   - String: user-input, length of room in meters
#   - String: user-input, width of room in meters
# - Output:
#   - String: print, display the room in meters and square feet
# - Rules:
#   - 1 square meter = 10.7639 square feet
#   - assume input is valid

# - Data structure:
#   - Float: to store the dimensions in meters
#   - Float: to store the dimensions in square feet
# - Algorithm:
#   - prompt user for the length
#   - save response as length
#   - convert to integer
#   - prompt the user for the width
#   - save response and convert to integer
#   - calculate square meters and square feet
#     - length * width = meters
#     - meters * 10.7639 = feet
#   - format feet to only output 2 digits after decimal
#   - print out response


def calc_room_dimensions
  puts "<< Enter the length of the room in meters:"
  length = gets.chomp.to_i
  puts "<< Enter the width of the room in meters:"
  width = gets.chomp.to_f
  meters = width * length
  feet = meters * 10.7639
  feet = format('%0.2f', feet)
  meters = format('%0.2f', meters)
  puts "The area of the room is #{meters} square meters (#{feet} square feet)."
end

calc_room_dimensions

# - Tests:
# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).