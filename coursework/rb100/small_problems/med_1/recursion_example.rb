# This example if from Chris Pine's book Learn to Program

# def ask_recursively(question)
#   puts question
#   reply = gets.chomp.downcase
#   if reply == 'yes'
#     true
#   elsif reply == 'no'
#     false
#   else
#     puts "Please answer 'yes' or 'no'"
#     ask_recursively(question)
#   end
# end

# ask_recursively "Do you want to go to bed?"

# second recursion example
# def factorial(n)
#   if n < 0
#     return 'You cant take the factorial of a negative number'
#   end
#   if n <= 1
#     1
#   else
#     n * factorial(n - 1)
#   end
# end

# 3 * 2 * 1
# 6

# The expression is not completely calculated until the last
# factorial method call returns it's value, which is 1
# each method call subtracts 1 from n, reducing the number being passed in by 1.
# the factorial of a number is all the product of all the factorials
# of a number down to 1

# recursion example 3
# - 11x11 word, represented as an array of arrays
#   find the continent in the middle (5, 5)
# - don't count land tiles belonging to any of the other continents
# - tiles touching only at the corners are still considered to be on the same
# continent
#
# psuedo-code solution
# - look at every tile on the map
#   - if that tile is a land tile on the continent we are looking for
#     add 1 to the running total
#
# - count the spot you are standing on, in this case (5,5)
# - send out 8 guys, one in each direction,
#   telling them to each count the rest of the continent in that direction
#
# rules
# - nobody can count a tile that somebody
M = 'land'
o = 'water'
world = [
  [o,o,o,o,o,M,o,o,o,o,o],
  [o,o,o,o,M,M,o,o,o,o,o],
  [o,o,o,o,o,M,o,o,M,M,o],
  [o,o,o,M,o,M,o,o,o,M,o],
  [o,o,o,o,o,M,M,o,o,o,o],
  [o,o,o,o,M,M,M,M,o,o,o],
  [M,M,M,M,M,M,M,M,M,M,M],
  [o,o,o,M,M,o,M,M,M,o,o],
  [o,o,o,o,o,o,M,M,o,o,o],
  [o,M,o,o,o,M,M,o,o,o,o],
  [o,o,o,o,o,M,o,o,o,o,o]]

def continent_size(world, x, y)
  if world[y][x] != 'land'
    # Either it's water or we have already counted it,
    # but either way, we don't want to count it now.
    return 0
  end

  # So first we count this tile...
  size = 1
  world[y][x] = 'counted land'
  # ... then we count all of the neighboring eight tiles
  # (and, of course, their neighbors by way of recursion)
  size = size + continent_size(world, x-1, y-1)
  size = size + continent_size(world, x , y-1)
  size = size + continent_size(world, x+1, y-1)
  size = size + continent_size(world, x-1, y )
  size = size + continent_size(world, x+1, y )
  size = size + continent_size(world, x-1, y+1)
  size = size + continent_size(world, x , y+1)
  size = size + continent_size(world, x+1, y+1)
  size
end

puts continent_size(world, 5, 5)
