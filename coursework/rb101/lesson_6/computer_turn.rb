require 'pry'

def find_at_risk_square(line, board)
  # does the line in question have 2 user markers?
  if board.values_at(*line).count('X') == 2
    # selects the key, value pair where the line includes the key
    # and the value is empty
    # returns the key
    board.select{|k,v| line.include?(k) && v == ' '}.keys.first
  else
    nil
  end
end

def find_possible_winning_square(line, board)
  if board.values_at(*line).count('O') == 2
    board.select{ |k, v| line.include?(k) && v == ' '}.keys.first
  else
    nil
  end
end


def computer_turn!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_possible_winning_square(line, brd)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd)
      break if square
    end
  end

  if !square
    if brd[5] == INITIAL_MARKER
      square = 5
    end
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

# Test cases
# board = {
#   1 => 'X', 2 => ' ', 3 => 'X',
#   4 => ' ', 5 => ' ', 6 => ' ',
#   7 => ' ', 8 => ' ', 9 => 'X'
# }

# computer_turn!(board)
# p board
# computer_turn!(board)
