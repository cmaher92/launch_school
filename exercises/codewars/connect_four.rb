require 'pry'
# Connect Four
# The grid is 6 row by 7 columns, those being named from A to G.

# You will receive a list of strings showing the order of the pieces which dropped in columns:

#   pieces_position_list = ["A_Red",
#                           "B_Yellow",
#                           "A_Red",
#                           "B_Yellow",
#                           "A_Red",
#                           "B_Yellow",
#                           "G_Red",
#                           "B_Yellow"]

# The list may contain up to 42 moves and shows the order the players are playing.

# The first player who connects four items of the same color is the winner.

# You should return "Yellow", "Red" or "Draw" accordingly

# [["r", "y", "y", "r", "e", "e"],
#  ["r", "r", "y", "y", "e", "e"],
#  ["y", "y", "r", "r", "e", "e"],
#  ["y", "y", "r", "y", "r", "y"],
#  ["r", "y", "r", "e", "e", "e"],
#  ["r", "r", "y", "e", "e", "e"],
#  ["y", "r", "r", "y", "e", "e"]]


COLUMNS_TO_INDEX = {
  'A' => 0,
  'B' => 1,
  'C' => 2,
  'D' => 3,
  'E' => 4,
  'F' => 5,
  'G' => 6
}

COLORS = ['y', 'r']

# populate board
def create_board(moves)
  # create an array that's 6 rows and 7 columns
  board = Array.new(7) {Array.new}
  # parse moves and place into board
  moves.each do |move|
    column, color = move.split('_')
    column = COLUMNS_TO_INDEX[column]
    color  = color.downcase[0]
    board[column] << color
  end

  board.each do |col|
    until col.size == 6
      col << 'e'
    end
  end

  board
end

def sequential?(color, a)
  # see if the given array has four of the same color in a row
  in_a_row = 0
  a.each do |move|
    if move == color 
      in_a_row += 1
      return true if in_a_row == 4
    else 
      in_a_row = 0
    end 
  end
  false
end 

def who_won(arr)
  winner = 'Draw'
  COLORS.each do |color|
    arr.each do |a|
      next if a.count(color) < 4
      return color if sequential?(color, a)
    end 
  end 
  winner
end 


def create_columns(board)
  columns = []
  board.each do |column|
    columns << column
  end
  columns
end

def create_rows(board)
  rows = []
  
  
  # place each row into the array of rows
  idx = 0
  until rows.count == 6
    row = []
    board.each do |column|
      row << column.at(idx)
    end
    idx += 1
    rows << row
  end
  
  rows
end

# [
#  ["r", "y", "y", "r", "e", "e"],
#  ["r", "r", "y", "y", "e", "e"],
#  ["y", "y", "r", "r", "e", "e"],
#  ["y", "y", "r", "y", "r", "y"],
#  ["r", "y", "r", "e", "e", "e"],
#  ["r", "r", "y", "e", "e", "e"],
#  ["y", "r", "r", "y", "e", "e"]
# ]

def create_diagonal_arr(board, starting_point)
  x = starting_point[0]
  y = starting_point[1]
  arr = []
  
  while true do
    arr << board[x][y]
    x += 1
    y += 1
    break if x >= board.size
    break if y >= board[0].size
  end
  arr
end

def create_diagonal_up_arr(board, starting_point)
  # creates an array starting in the bottom left of the board to the top right
  arr = []
  x = starting_point[0]
  y = starting_point[1]
  
  while true do
    arr << board[x][y]
    x -= 1
    y += 1
    break if x < 0
    break if y >= board[0].size
  end 
  arr
end

def create_diagonals(board)
  diagonals = []
  diagonals << create_diagonal_arr(board, [0, 0])
  diagonals << create_diagonal_arr(board, [0, 1])
  diagonals << create_diagonal_arr(board, [0, 2])
  diagonals << create_diagonal_arr(board, [1, 0])
  diagonals << create_diagonal_arr(board, [2, 0])
  diagonals << create_diagonal_arr(board, [3, 0])
  

  diagonals << create_diagonal_up_arr(board, [6,0])
  diagonals << create_diagonal_up_arr(board, [5,0])
  diagonals << create_diagonal_up_arr(board, [4,0])
  diagonals << create_diagonal_up_arr(board, [3,0])
  diagonals << create_diagonal_up_arr(board, [6,1])
  diagonals << create_diagonal_up_arr(board, [6,2])
  
 diagonals
end


def who_is_winner(moves)
  board = create_board(moves)
  
  binding.pry
  
  rows = create_rows(board)
  columns = create_columns(board)
  diagonals = create_diagonals(board)
  all = []
  rows.each { |row| all << row }
  columns.each { |column| all << column }
  diagonals.each { |diagonal| all << diagonal }
  winner = who_won(all)
  if winner == 'y'
    return 'Yellow'
  elsif winner == 'r'
    return 'Red'
  else
    return 'Draw'
  end
end


puts who_is_winner(["F_Yellow",
    "G_Red",
    "D_Yellow",
    "C_Red",
    "A_Yellow",
    "A_Red",
    "E_Yellow",
    "D_Red",
    "D_Yellow",
    "F_Red",
    "B_Yellow",
    "E_Red",
    "C_Yellow",
    "D_Red",
    "F_Yellow",
    "D_Red",
    "D_Yellow",
    "F_Red",
    "G_Yellow",
    "C_Red",
    "F_Yellow",
    "E_Red",
    "A_Yellow",
    "A_Red",
    "C_Yellow",
    "B_Red",
    "E_Yellow",
    "C_Red",
    "E_Yellow",
    "G_Red",
    "A_Yellow",
    "A_Red",
    "G_Yellow",
    "C_Red",
    "B_Yellow",
    "E_Red",
    "F_Yellow",
    "G_Red",
    "G_Yellow",
    "B_Red",
    "B_Yellow",
    "B_Red"])

# thoughts
#   didn't consider checking for winner on the fly, which is leading to incorrect winners

# new possible approach
# create empty board
# place a piece
# check row, column, possible diagonals from that position
# if no winner, continue
