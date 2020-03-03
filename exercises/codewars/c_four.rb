# create an empty board
# parse list of moves
# place a piece
# check for winner

# to do
#   find all the horizontal moves for the move that just occurred
#   find all the 45 degree angle moves
#   find all the 135 degree angle moves
#   check to see if any of the above contain a winner

require 'pry'

  MAP_TO_IDX = {
  'A' => 0,
  'B' => 1,
  'C' => 2,
  'D' => 3,
  'E' => 4,
  'F' => 5,
  'G' => 6
}

def create_empty_board
  board = Array.new(7) {Array.new}
  board.each do |col|
    7.times { col << '' }
  end
  board
end

def parse_moves(pieces_position_list)
  pieces_position_list.map! { |move| move.split('_')}
  pieces_position_list.map! { |move| [MAP_TO_IDX[move[0]], move[1]] }
  pieces_position_list
end

def check_winner(move, board)
  vertical = board[move[0]]

  # horizontal
  #   find the index of the last move
  #   find all in that index


end

def place_pieces_check(board, moves)
  # place a piece
  # check for winner
  moves.each do |move|
    arr = board[move[0]].select { |item| item != '' }
    arr << move[1]
    until arr.size == 6
      arr << ""
    end
    board[move[0]] = arr
  end
end

def who_is_winner(pieces_position_list)
  board = create_empty_board
  moves = parse_moves(pieces_position_list)
  place_pieces_check(board, moves)
  binding.pry

end

who_is_winner([
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
