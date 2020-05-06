# Battle ships (5 kyu)

# Task
# Your task in the kata is to determine 
# how many boats are sunk damaged and untouched from a set amount of attacks. 
# You will need to create a function that takes two arguments, 
# the playing board and the attacks.

# Boats are placed either horizontally, vertically or diagonally on the board. 
# 0 represents a space not occupied by a boat. 
# Digits 1-3 represent boats which vary in length 1-4 spaces long. 
# There will always be at least 1 boat up to a maximum of 3 in any one game. 
# Boat sizes and board dimentions will vary from game to game.

# Attacks
# Attacks are calculated from the bottom left, 
# first the X coordinate then the Y. 
# There will be at least one attack per game, 
# and the array will not contain duplicates.

# [[2, 1], [1, 3], [4, 2]]
# First attack      `[2, 1]` = `3`
# Second attack `[1, 3]` = `0`
# Third attack     `[4, 2]` = `1`

# Function Initialization
# board = [[0,0,0,2,2,0],
#          [0,3,0,0,0,0],
#          [0,3,0,1,0,0],
#          [0,3,0,1,0,0]]
# attacks = [[2, 1], [1, 3], [4, 2]]
# damaged_or_sunk(board, attacks)

# Scoring
# 1 point for every whole boat sank.
# 0.5 points for each boat hit at least once (not including boats that are sunk).
# -1 point for each whole boat that was not hit at least once.
# Sunk or Damaged
# `sunk` = all boats that are sunk
# `damaged` = all boats that have been hit at least once but not sunk
# `notTouched/not_touched` = all boats that have not been hit at least once
# Output
# You should return a hash with the following data

# `sunk`, `damaged`, `not_touched`, `points`
# Example Game Output
# In our above example..

# First attack: `boat 3` was damaged, which increases the `points` by `0.5`
# Second attack: miss nothing happens
# Third attack: `boat 1` was damaged, which increases the `points` by `0.5`
# `boat 2` was untouched so `points -1` and not_touched +1` in Python/Ruby.
# No whole boats sank
# Return Hash
# { 'sunk': 0, 'damaged': 2 , 'not_touched': 1, 'points': 0 }

# input:
#   - the playing board
#   - the attacks
# output:
#   - hash with the following data
#     - 'sunk'
#     - 'damaged'
#     - 'not_touched'
#     - 'points'
# constraints:
#   - digits 1-3 represent boats which vary in length 1-4 spaces long
#   - always at least 1 boat
#   - maximum 3 boats
#   - board size will vary
#   - attacks are calculated first for x, then y on the boards coordinates
#   - at least one attack per game
#   - array will not contain duplicates
#   - 1 point for boat sunk
#   - .5 points for each boat hit at least once
#     - not including boats that are sunk
#   - -1 point for untouched boats
# mental model:
#   - create a list of boats and their coordinates
#   - apply hits to boats hash
#     - if a boat is hit, coordinate is replaced with :x
#   - score game
#     - check for untouched boats 
#       - (values array will only contain other arrays)
#     - check for totally sunk boats
#       - (balues array will only contain :x's)
#     - count hits on non-totally sunk boats
# boats = { 
#   1 => [[4, 2], [4, 1]], 
#   2 => [[3, 4], [4, 4], [4, 5], [4, 6]], 
#   3 => [[2, 3], [2, 2], [2, 1]]
# ]
# attacks = [[2, 1], [1, 3], [4, 2]]
#   - check list of boats for sunk
#     - see if any boats only contain hits
#     - remove them if that's the case
#   - check list of boats for just hit
#     - for boats that aren't sunk, tally hits
#   - check list for untouched
#     - tally boats remaining
#   - score
# algorithm/data structure:
#   - create list of boats and coordinates according to game
#     - retrieve coordinates for each boat number
#       - iterate over entire board, if element is a boat number
#       - check if it exists in boats hash, if it does append coordinates
#       - if it doesn't add boat and coordinates array with current coordinates
#     - convert coordinates to board coordinates
#       - for each boat in hash
#       - retrieve coordinates array
#       - map each coordinate
#         - x = index + 1
#         - y = length of board - row_index
#   - mark attacks
#     - iterate over each coordinate for each cooresponding boat
#     - check if attacks array contains coordinate
#     - if it does, replace coordinate with an :x, denoting a hit
#   - score game
#     - create score hash
#     - # { 'sunk': 0, 'damaged': 2 , 'not_touched': 1, 'points': 0 }
#     - check boats_sunk -> Integer
#     - check boats_damaged -> Integer
#     - check boats_not_touched -> Integer
#     - calculate_score -> Integer
#       - (boats_sunk * 1), + (boats_damaged * 0.5) - (boats_not_touched * -1)
require 'pry'
def create_boats_hash(board)
  boats = {}
  board.each_with_index do |row, row_idx|
      row.each_with_index do |space, col_idx|
        if space > 0
          boats.has_key?(space) ? boats[space] << [row_idx, col_idx] : boats[space] = [[row_idx, col_idx]]
        end
      end
  end
  boats
end

def boat_indices_to_board_coordinates!(boat, board)
  boat.each do |boat, indices|
    indices.map! do |y, x|
      [(x + 1), (board.size - y)]
    end
  end
end

def mark_attacks!(boats, attacks)
  boats.each do |boat, coordinates|
    coordinates.map! do |coord|
      attacks.include?(coord) ? :x : coord
    end
  end
end

def boats_sunk(boats)
  score = 0
  boats.each do |boat, values|
    score += 1 if values.all? { |coord| coord == :x }
  end
  score
end

def boats_damaged(boats)
  score = 0
  boats.each do |_, values|
    total = values.size
    hits = values.count(:x)
    score += 1 if hits != total && hits != 0
  end
  score
end

def boats_not_touched(boats)
  score = 0
  boats.each do |_, values|
    score += 1 if values.count(:x) == 0
  end
  score
end

def calculate_score(score)
  points = 0
  sunk, damaged, not_touched = score.values
  points += sunk
  points += (damaged * 0.5)
  points -= not_touched
  points.to_i == points ? points.to_i : points
end

def damaged_or_sunk(board, attacks)
  boats = create_boats_hash(board)
  boat_indices_to_board_coordinates!(boats, board)
  mark_attacks!(boats, attacks)
  score = {
    'sunk' => 0,
    'damaged' => 0,
    'not_touched' => 0,
    'points' => 0
  }
  score['sunk'] = boats_sunk(boats)
  score['damaged'] = boats_damaged(boats)
  score['not_touched'] = boats_not_touched(boats)
  score['points'] = calculate_score(score)
  score
end 

board = [[0,0,0,2,2,0],
         [0,3,0,0,0,0],
         [0,3,0,1,0,0],
         [0,3,0,1,0,0]]
attacks = [[2, 1], [1, 3], [4, 2]]
p result = damaged_or_sunk(board, attacks)
