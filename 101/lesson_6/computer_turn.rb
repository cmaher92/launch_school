require 'tic_tac_toe.rb'

def computer_turn!(b)
  # randomly selects a square to place a piece based on what is available
  # empty_squares returns an array of keys representing the empty squares
  # on the board
  choice = empty_squares(b).sample
  b[choice] = CPU_MARKER
end
