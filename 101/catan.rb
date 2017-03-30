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

# Generate an array of 19 resources and randomize them
resource_options = { W: 4, F: 4, S: 4, O: 3, B: 3, D: 1 }

def randomize_order(resource_options)
  # Creates an array with 19 elements randomized
  total_count = 19

  resources = []

  while total_count > 0
    resource_options_arr = resource_options.to_a
    rand_index = rand(resource_options_arr.length)
    rand_resource = resource_options_arr[rand_index].first

    if resource_options[rand_resource] > 0
        resources.push rand_resource
        resource_options[rand_resource] -= 1
        total_count -= 1
    end
  end

  resources
end

def create_map(rand_list_of_resources)
    map = [
    [],
    [],
    [],
    [],
    [],
  ]

  height = 0

  while height <= 4
    if height == 0
      3.times { map[0] << rand_list_of_resources.pop }
      height += 1
    elsif height == 1
      4.times { map[1] << rand_list_of_resources.pop }
      height += 1
    elsif height == 2
      5.times { map[2] << rand_list_of_resources.pop }
      height += 1
    elsif height == 3
      4.times { map[3] << rand_list_of_resources.pop }
      height += 1
    elsif height == 4
      3.times { map[4] << rand_list_of_resources.pop }
      height += 1
    end
  end
  map
end

# Randomizes the resources
p rand_list_of_resources = randomize_order(resource_options)
# Builds the map
p create_map(rand_list_of_resources)

# function that assigns roll numbers to each resource, takes an array, returns a hash
# turn array into hash
# create a list of all the rolls, rolls = [ 2, 3, 3, 4, 4,  ]
# TODO: will need to adjust the create_map function to handle a hash instead of an array
# randomize the list of rolls
#
# iterate through the hash of
# assign each roll to a resource unless the resource is a Desert, then skip
