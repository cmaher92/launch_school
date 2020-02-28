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

# set up the board
# for each item in the moves list
  # parse the string
  # place on board
  # check winner

def new_board
  # create board that's 6x7
  board = {
    "A" => Array.new(6, ""),
    "B" => Array.new(6, ""),
    "C" => Array.new(6, ""),
    "D" => Array.new(6, ""),
    "E" => Array.new(6, ),
    "F" => Array.new(),
    "G" => Array.new(),
    }
  
end

def check_winner(board)
end

def  who_is_winner(moves)
  board = new_board
  moves.each do |move|
    column, color = move.split("_")
    board[column]
  end
end