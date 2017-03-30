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

W = 'wheat'
F = 'forest'
S = 'sheep'
O = 'Ore'
B = 'Brick'
D = 'Desert'

# Generate an array of 19 resources and randomize them
resource_options = { W: 4, F: 4, S: 4, O: 3, B: 3, D: 1 }

def randomize(resource_options)
  total_count = 0

  # While total_count > 0
  #   select random_resource from resource_options
  #   if resource_options[random_resource] > 0
  #     add it to the resources array
  #     subtract 1 from that resource
  #     also subtract 1 crom total_count
  #   elsif
  #     next

  while
end
