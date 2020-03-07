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
    if x < 0 || y < 0
      moves << ""
      x += 1
      y += 1
    elsif x > 6 || y > 5
      moves << ""
      x += 1
      y += 1
    else
      moves << board[x][y]
      x += 1
      y += 1
    end
  end
  moves
end

def find_moves_on_135(board, move, index)
  x = move[0] + 3
  y = index - 3
  moves = []
  until moves.size == 8 do
    if x < 0 || y < 0
      moves << ""
      x -= 1
      y += 1
    elsif x > 6 || y > 5
      moves << ""
      x -= 1
      y += 1
    else
      moves << board[x][y]
      x -= 1
      y += 1
    end
  end
  moves
end

def check_winner(move, board)
  vertical = board[move[0]]

  # horizontal
  index = board[move[0]].select { |item| item != '' }.size
  index = index - 1
  horizontal = []
  board.each { |col| horizontal << col[index] }

  # find moves on 45 degree angle
  diagonals_45 = find_moves_on_45(board, move, index)

  # find moves on 135 degree angle
  diagonals_135 = find_moves_on_135(board, move, index)

  # combine all moves
  lines = [vertical] + [horizontal] + [diagonals_45] + [diagonals_135]

  # select lines with four or more in array
    # if there isn't return false
    # if there is
      # check each line to see if there is four in a row

  lines = lines.select! { |line| line.count(move[1]) >= 4 }
  if lines.count == 0
    return false
  else
    lines.each do |line|
      in_a_row = 0
      line.each do |color|
        move[1] == color ? in_a_row += 1 : in_a_row = 0
        return true if in_a_row == 4
      end
    end
  end
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
    if check_winner(move, board) == true
      return move[1]
    end
  end
end

def who_is_winner(pieces_position_list)
  winner = "Draw"
  board = create_empty_board
  moves = parse_moves(pieces_position_list)
  winner = place_pieces_check(board, moves)
  return winner
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
