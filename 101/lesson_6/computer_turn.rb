WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

USER_MARKER = 'X'
INITIAL_MARKER = ' '
CPU_MARKER = 'O'


require 'pry'
# def computer_turn!(b)
#   # randomly selects a square to place a piece based on what is available
#   # empty_squares returns an array of keys representing the empty squares
#   # on the board
#   choice = empty_squares(b).sample
#   b[choice] = CPU_MARKER
# end

# check the board's lines to see if anywhere on the board
#   the player has 2 squares within the winning line.
# if the user does not have 2 squares within the lines
#   choose a square at random
# otherwise, place the square that will defend the user's
#   ability to win the game


# psuedo-code
# for each line in WINNING_LINES
#   retrieve the array of selections by passing the line into values_at
#   check the array of selections to see if it contains 2 player squares && 1 empty square
#   if it does
#     set local variable selection to the square
#   otherwise
#     next
# if selection is not "" select that square, if it is "" sample a random square
#   from what's available

# algorithm
#   set local variable selection to 0
#   for each line in WINNING_LINES
#     find the values_at the line array from the board hash
#     set to a local variable array called 'possible_winning_line'
#     count the player markings and empty squares in possible_winning_line
#     if the count of player markings is 2 AND the count of empty squares is 1
#     selection = possible_winning_line.value("")
#     otherwise, just skip to the next iteration
#   if selection is not 0, select that square and return board
#   if selection is 0, randomly select a square by sampling empty_squares(b)

# def empty_squares(b)
#   # finds the keys where the value in the board hash
#   # is equivalent to the INITIAL_MARKER
#   b.keys.select { |k| b[k] == INITIAL_MARKER }
# end
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

  brd[square] = CPU_MARKER
end


# The logic is simple:
# if the computer already has 2 in a row,
# then fill in the 3rd square,
# as opposed to moving at random.




# Test cases
# board = {
#   1 => 'X', 2 => ' ', 3 => 'X',
#   4 => ' ', 5 => ' ', 6 => ' ',
#   7 => ' ', 8 => ' ', 9 => 'X'
# }

# computer_turn!(board)
# p board
# computer_turn!(board)
