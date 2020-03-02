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


def check_columns(board)
  winner = ''
  COLORS.each do |color|
    board.each do |column|
      next if column.count(color) < 4
      seq_order = 0
      column.each do |tile|
        if seq_order == 4
          return color
        end
        if tile == color
          seq_order += 1
        else
          seq_order = 0
        end
      end
    end
  end
  winner
end

def check_rows(board)
  winner = ''
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
  
  # check each row for four in sequential order
  COLORS.each do |color|
    rows.each do |row|
      next if row.count(color) < 4
      
      seq_order = 0
      row.each do |tile|
        return color if seq_order == 4
        tile == color ? seq_order += 1 : seq_order = 0
      end
    end
  end
  winner
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

def check_diagonals(board)
  # generate array of arrays with each diagonal possibility
  # [0, 0], [1, 1], [2, 2], [3, 3], [4, 4], [5, 5]
  # [0, 1], [1, 2], [2, 3], [3, 4], [4, 5]
  # [0, 3], [1, 4], [2, 5]
  # [0, 4], [1, 5]
  # [0, 5]
 
  # [1, 0], [2, 1], [3, 2], [4, 3], [5, 4], [6, 5]
  # [2, 0], [3, 1], [4, 2], [5, 3], [6, 4]
  # [3, 0], [4, 1], [5, 2], [6, 4] 
  
  # pass the board
  # generate an array of diagonals
    # give a starting point
    # for each iteration, increase x and y by 1 until nothing is there
  diagonals = []
  diagonals << create_diagonal_arr(board, [0, 0])
  diagonals << create_diagonal_arr(board, [0, 1])
  diagonals << create_diagonal_arr(board, [0, 2])
  diagonals << create_diagonal_arr(board, [1, 0])
  diagonals << create_diagonal_arr(board, [2, 0])
  diagonals << create_diagonal_arr(board, [3, 0])
  binding.pry
  
end


def who_is_winner(moves)
  board = create_board(moves)

  winner = check_columns(board)
#   binding.pry
  winner = check_rows(board)
#   binding.pry
  winner = check_diagonals(board)
  binding.pry
  
end


puts who_is_winner([
  "C_Yellow",
  "E_Red",
  "G_Yellow",
  "B_Red",
  "D_Yellow",
  "B_Red",
  "B_Yellow",
  "G_Red",
  "C_Yellow",
  "C_Red",
  "D_Yellow",
  "F_Red",
  "E_Yellow",
  "A_Red",
  "A_Yellow",
  "G_Red",
  "A_Yellow",
  "F_Red",
  "F_Yellow",
  "D_Red",
  "B_Yellow",
  "E_Red",
  "D_Yellow",
  "A_Red",
  "G_Yellow",
  "D_Red",
  "D_Yellow",
  "C_Red"])
