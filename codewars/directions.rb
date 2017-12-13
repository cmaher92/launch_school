# def dirReduc(arr)
#   # input
#   #  arr of strings, each string represents a direction
#   # output
#   #   condensed array of strings
require 'pry'
#   opposites = { 'NORTH' => 'SOUTH', 'SOUTH' => 'NORTH', 'EAST' => 'WEST', 'WEST' => 'EAST' }
#
#   dirs = Hash.new(0)
#   # turn the arr into a hash, each value representing the number of directions
#   # compare the current key's value with the opposite
#   #   if they are the same, set each value to 0
#   #   if the current key is greater than the opposite, subtract the opposite from the current
#   #   if the opposite key is greater, subtract the current key from the opposite
#
#   arr.each do |dir|
#     dirs[dir] += 1
#   end
#   results = []
#
# end

OPPOSITE = {
  "NORTH" => "SOUTH",
  "SOUTH" => "NORTH",
  "EAST"  => "WEST",
  "WEST"  => "EAST"
}

def dirReduc(arr)
  stack = []
  arr.each do |dir|
    # binding.pry
    OPPOSITE[dir] == stack.last ? stack.pop : stack.push(dir)
  end
  stack
end

=begin
  The key to this above solution
  he creates a stack
  For each iteration he compares the last value added
  to the current direction's opposite
  if they are opposite he simply removes the value from the stack
  if they aren't opposite he pushes the value

=end

# a = ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]
a = %w(NORTH WEST SOUTH EAST)
p dirReduc(a)
# u=["NORTH", "WEST", "SOUTH", "EAST"]
