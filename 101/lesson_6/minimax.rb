# Game-tree

require 'pry'


# def generate_moves(board, current_player)
#   next_player = (current_player == 'X' ? 'O' : 'X')
#   moves = {}
#   board.each_with_index do |player_at_position, position|
#     unless player_at_position
#       next_board = board.dup
#       next_board[position] = current_player
#       moves[next_board] = generate_moves(next_board, next_player)
#     end
#   end
#
#   moves
# end

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def someone_won?(board)
  WINNING_LINES.each do |line|
    if [ board[line[0]], board[line[1]], board[line[2]] ].all?
      return true
    else
      return false
    end
  end
end

def win?(board, player)
  WINNING_LINES.each do |line|
    if [ board[line[0]], board[line[1]], board[line[2]]  ].all? { |piece| piece == player }
      return true
    else
      return false
    end
end

def score(board, player)
  opponent = (player == 'X' ? 'O' : 'X')
  if win?(board, player)
        return 1
    elsif win?(board, opponent)
        return -1
    else
        return 0
    end
end

def final_state?(board)
  someone_won?(board) || board_full?(board)
end

def get_available_moves(board)
  # return array
end

def minimax(board, player)
  return score(board, player) if final_state?(board)
  next_player = ( player == 'X' ? 'O' : 'X')
  scores = []
  moves = []

  get_available_moves(board).each do |move|
    scores.push minimax(move, next_player)
    moves.push move
  end

  if player == 'X'
    # find the max
    max_score_index = scores.each_with_index.max[1]
    # @choice = moves[max_score_index]
    return scores[max_score_index]
  else
    min_score_index = scores.each_with_index.max[1]
    # @choice = moves[min_score_index]
    return scores[min_score_index]
  end
end

# if the game is over return the score
# otherwise, get a list of new game states for every possible move
# create scores list
# create a moves list
# for each board
#   add the minimax result of that state to the scores list
# if it's X's turn return the max from the scores list
# if it's 0's turn return the min from the scores list

# return the score of the game if the game is over
# create scores list
# create moves list
# populate the scores array, recursing as needed
#   iterate over the result of get_available_moves(board)
#     for each move, push the result of minimax(board) to the scores
#     push the move to the move's arr
# Do the min or the max calculation
#   if it's 'X' turn
#     max_score_index = scores.each_with_index.max[1]
#     choice = moves[max_score_index]
#     return scores[max_score_index]

board = Array.new(9)
game_tree = { board => generate_moves(board, 'X') }
binding.pry
puts 'hello'
