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

# input
  # array; strings; "(column)_color"; "A_Red"
# output
  # string; yellow, red, or draw accordingly

# set up an 6x7 board
  # array of arrays

# populate board with pieces


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

# recursively check for winner
# check current tile
#   if it's empty, return 0
#   if it's the color +1 in_a_row
#   check_surrounding items
#     if 0, returned stop checking
#     if 1, is return keep checking
#

  # fill empty spots with 'e'
  board.each do |col|
    until col.size == 6
      col << 'e'
    end
  end

  board
end

# [["r", "y", "y", "r", "e", "e"],
#  ["r", "r", "y", "y", "e", "e"],
#  ["y", "y", "r", "r", "e", "e"],
#  ["y", "y", "r", "y", "r", "y"],
#  ["r", "y", "r", "e", "e", "e"],
#  ["r", "r", "y", "e", "e", "e"],
#  ["y", "r", "r", "y", "e", "e"]]

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

  # check all the items with the index of 0
  # check all the items with the index of 1
  # etc..
  COLORS.each do |color|
    row_num = 0
    while row_num < 6 do
      col_num = 0
      while col_num < 7
        puts "row: #{row_num}"
        puts "column #{col_num}"
        col_num += 1
      end
      row_num += 1
    end
  end

end

def who_is_winner(moves)
  board = create_board(moves)

  winner = check_columns(board)
  return winner if winner != ''
  winner = check_rows(board)


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
