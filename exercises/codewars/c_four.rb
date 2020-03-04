# create an empty board
# parse list of moves
# place a piece
# check for winner

# to do
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

def print_board(board)
end

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

def find_moves_on_45(board, move, index)
  x = move[0] - 3
  y = index - 3
  
  moves = []
  until moves.size == 8 do
    if board[x] == nil
      moves << ""
      x += 1
      y += 1
    else
      moves << board[x].fetch(y, "")
      x += 1
      y += 1
    end 
  end
  moves
end

def find_moves_on_135(board, move, index)
  x = move[0] + 3
  y = index + 3
  moves = []
  until moves.size == 8 do
    if board[x] == nil
      moves << ""
      x -= 1
      y -= 1
    else
      moves << board[x].fetch(y, "")
      x -= 1
      y -= 1
    end 
  end
  moves
end

def check_winner(move, board)
  vertical = board[move[0]]

  # horizontal
  #   find the index of the last move
  #   find all in that index
  index = board[move[0]].select { |item| item != '' }.size
  index = index - 1
  horizontal = []
  board.each { |col| horizontal << col[index] }

  # find 45 degree moves
  diagonals_45 = find_moves_on_45(board, move, index)

  # find moves on 135 degree angle
  diagonals_135 = find_moves_on_135(board, move, index)
  lines = [vertical] + [horizontal] + [diagonals_45] + [diagonals_135]

  binding.pry
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
    check_winner(move, board)
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
