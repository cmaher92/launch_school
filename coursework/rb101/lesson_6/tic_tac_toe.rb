# tic_tac_toe.rb

require 'pry'
require 'pry-byebug'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagnals
WHOS_FIRST = 'Player'

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

# rubocop:disable Metrics/AbcSize:
def display_board(board)
  system 'clear'
  puts "     |     |"
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
  puts "     |     |"
end
# rubocop:enable Metrics/AbcSize:

def prompt(msg)
  puts ">> #{msg}"
end

def joiner(list, delimiter=',', joining_word='or')
  list.map do |word| 
    if word == list[-2]
      "#{word} #{joining_word} "
    elsif word == list[-1]
      word
    else
      "#{word}#{delimiter} "
    end
  end.join
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def player_places_piece!(board)
  square = ''

  loop do
    prompt "Choose a square (#{joiner(empty_squares(board), ",", "or")}):"
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    prompt("Sorry that's not a valid choice")
  end

  board[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def computer_places_piece!(board)
  square = nil

  # offense first
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, board, COMPUTER_MARKER)
    break if square
  end

  # defense
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, board, PLAYER_MARKER)
      break if square
    end
  end

  # middle square if available and no offense and defense moves found
  if !square && board[5] == INITIAL_MARKER
    square = 5
  end

  # just pick a square
  if !square
    square = empty_squares(board).sample
  end

  board[square] = COMPUTER_MARKER
end

def board_full?(board)
  empty_squares(board).empty?
end

def someone_won?(board)
  !!detect_winner(board)
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    return 'Player' if line.all? { |pos| board[pos] == PLAYER_MARKER }
    return 'Computer' if line.all? { |pos| board[pos] == COMPUTER_MARKER }
  end
  nil
end

def ask_if_match?
  response = nil
  loop do
    prompt "Would you like to play a match?"
    prompt "First to 5 wins (y or n)"
    response = gets.chomp
    break if response.match?(/^[yn]$/i)
    prompt "That's an invalid option, please enter either (y or n)."
  end
  response.match?(/[y]/i) ? true : false
end

def update_score!(score, winner)
  winner = 'X' if winner == 'Player'
  winner = 'O' if winner == 'Computer'
  score[winner] += 1
end

def display_score(score)
  # update so it says point if only 1
  player_score = score[PLAYER_MARKER]
  computer_score = score[COMPUTER_MARKER]
  player_score == 1 ? prompt("You have 1 point") : prompt("You have #{player_score} points")
  computer_score == 1 ? prompt("The computer has 1 point") : prompt("The computer has #{computer_score} points")
end

def someone_won_match?(score)
  score.any? { |_, v| v == 5 }
end

def ask_whos_first
  loop do
    prompt('Who should go first?')
    prompt('Please enter 1 for player, 2 for computer.')
    response = gets.chomp
    break true if response == '1'
    break false if response == '2'
    prompt('That is not a valid entry, please try again.')
  end
end

def place_piece!(board, current_player)
  current_player == 'Player' ? player_places_piece!(board) : computer_places_piece!(board)
end

def alternate_player(current_player)
  current_player = current_player == 'Player' ? 'Computer' : 'Player'
end


# GAME LOGIC ----------------------------------
score = { PLAYER_MARKER => 0, COMPUTER_MARKER => 0 }
is_a_match = ask_if_match?

loop do # game
  board = initialize_board
  if WHOS_FIRST == 'Player'
    player_first = true
  elsif WHOS_FIRST == 'Computer'
    player_first = false
  else
    player_first = ask_whos_first
  end
  current_player = player_first == true ? 'Player' : 'Computer'

  loop do # turn
    display_board(board)
    display_score(score) if is_a_match
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)
  if someone_won?(board)
    winner = detect_winner(board)
    prompt "#{winner} won!"
    update_score!(score, winner)
  else
    prompt "It's a tie!"
  end

  if is_a_match
    display_score(score)
    break if someone_won_match?(score)
    sleep(2)
  end
  
  prompt "Play again (y or n)"
  answer = gets.chomp
  break if answer == 'n'
end

prompt "Thanks for playing tic tac toe. Goodbye!"