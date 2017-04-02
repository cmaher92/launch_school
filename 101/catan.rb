require 'pry'

# Catan
# Randomize a catan map
# Calculate the best position to place a settlement
# Calculate the percentage of each resource

# Brick
# Sheep
# Wood
# Wheat
# Ore

# 15 roads, 5 settlements, and 4 cities

# Hexagon
# 6 sides

# Hexes
# Wheat - 4
# Forest - 4
# Sheep - 4
# Ore - 3
# Brick - 3
# Desert - 1

# W = 'wheat'
# F = 'forest'
# S = 'sheep'
# O = 'Ore'
# B = 'Brick'
# D = 'Desert'

# High level
# Create an random array of resources
def create_random_resources
  resource_options = { W: 4, F: 4, S: 4, O: 3, B: 3, D: 1 }
  resources = []
  resource_options.each do |resource, quantity|
    while quantity > 0
      resources.push resource
      quantity -= 1
    end
  end
  resources.shuffle
end

# Create an random array of odds
def create_random_odds
  odds = [2, 12, 3, 3, 4, 4, 5, 5, 6, 6, 8, 8, 9, 9, 10, 10, 11, 11]
  odds.shuffle
end

# Combine the resources and odds arrays
def combine_resources_odds(resources, odds)
  resources_odds = Array.new(19, [])
  resources_odds.map! do |tile|
    resource = resources.pop
    odd = odds.pop
    if resource == :D
      odds << odd
      tile = [resource, 0]
    else
      tile = [resource, odd]
    end
  end
  resources_odds
end

# Create the board
def create_board(resources_and_odds)
  board = []
  board.push create_row(3, resources_and_odds)
  board.push create_row(4, resources_and_odds)
  board.push create_row(5, resources_and_odds)
  board.push create_row(4, resources_and_odds)
  board.push create_row(3, resources_and_odds)
  board
end

# Print the board
def print_board(board)
  board.each do |row|
    p row
  end
end

# Private functions
def create_row(size, array)
  # function is only called by another function
  Array.new(size) { array.pop }
end

resources = create_random_resources
odds = create_random_odds
resources_odds = combine_resources_odds(resources, odds)
board = create_board(resources_odds)
print_board(board)
