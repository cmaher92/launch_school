require 'pry'
require_relative 'joinor'
# require_relative 'computer_turn'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

def play_again?(match_or_game)
  prompt("Would you like to play another #{match_or_game}? (y/n)")
  choice = gets.chomp.downcase
  choice == 'n' ? false : true
end

def initialize_board
  board = {}
  1.upto(9) do |i|
    board[i] = INITIAL_MARKER
  end
  board
end

def initialize_score
  { "Player" => 0, "Computer" => 0 }
end

def update_score!(score, winner)
  score[winner] += 1
end

# rubocop:disable Metrics/AbcSize
def display_board(b, score)
  system 'clear'
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts "You have won #{score['Player']} games"
  puts "The computer has won #{score['Computer']} games"
  puts ""
  puts "     |     |"
  puts "  #{b[1]}  |  #{b[2]}  |  #{b[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{b[4]}  |  #{b[5]}  |  #{b[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{b[7]}  |  #{b[8]}  |  #{b[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def computer_turn!(board)
  # given the board
  # calculate the possible moves
  moves = calculate_moves(board)
  # check to see if any of the moves are winners, loser, or ties
end

def calculate_moves(board)
  empty_spots = empty_squares(board)
  possible_moves = []
  until empty_spots.empty?
    possible_move = Hash.new
    possible_move.replace(board)
    move = empty_spots.pop
    possible_move[move] = COMPUTER_MARKER # this is manipulating the board
    possible_moves << possible_move
  end
  possible_moves
end

def empty_squares(b)
  # finds the keys where the value in the board hash
  # is equivalent to the INITIAL_MARKER
  b.keys.select { |k| b[k] == INITIAL_MARKER }
end

def player_turn!(b)
  square = ''
  loop do
    prompt("Please select where you want to place your piece")
    # binding.pry
    prompt("Squares #{joinor(empty_squares(b), ', ', 'and')} are available")
    square = gets.chomp.to_i
    break if empty_squares(b).include?(square)
    prompt("That's an invalid choice.")
  end
  b[square] = PLAYER_MARKER
  b
end

def board_full?(b)
  # returns true when there are no more empty squares
  # check to see if b.empty_squares is empty
  empty_squares(b).empty? == true
end

def someone_won?(b)
  # returns a boolean
  !!detect_winner(b)
end

def detect_winner(b)
  WINNING_LINES.each do |line|
    if [b[line[0]], b[line[1]], b[line[2]]].all? { |m| m == PLAYER_MARKER }
      return 'Player'
    elsif [b[line[0]], b[line[1]], b[line[2]]].all? { |m| m == COMPUTER_MARKER }
      return 'Computer'
    end
  end
  nil
end

def detect_match_winner(s)
  s.select { |k, v| k if v == 5 }.to_a[0][0]
end

def display_winner(score, board)
  winner = detect_winner(board)
  display_board(board, score)
  prompt("#{winner} won!")
  winner
end

def display_tie(score, board)
  display_board(board, score)
  prompt("It's a tie!")
end

def place_piece!(board, current_player)
  if current_player == 'player'
    player_turn!(board)
    current_player = 'computer'
  else
    computer_turn!(board)
    current_player = 'player'
  end
  current_player
end

def play_game(score, board, current_player)
  display_board(board, score)
  current_player = place_piece!(board, current_player)
  if !!someone_won?(board) || board_full?(board)
    return
  else
    play_game(score, board, current_player)
  end
end

def play_match(score, starting_player)
  board = initialize_board
  play_game(score, board, starting_player)
  if someone_won?(board)
    winner = display_winner(score, board)
    update_score!(score, winner)
  else
    display_tie(score, board)
  end
  sleep(2)
  return if score.values.any? { |total| total == 5 }
  play_match(score, starting_player)
end

def who_goes_first
  starting_player = ""
  loop do
    prompt('Who should go first.. You or the computer?')
    prompt('Please type 1 if you should go, or 2 if the computer should go')
    choice = gets.chomp
    if choice == '1'
      starting_player = 'player'
      break
    elsif choice == '2'
      starting_player = 'computer'
      break
    else
      prompt("Invalid option, please type either '1' or '2'")
      sleep(1)
    end
  end
end

loop do
  # start of a tic tac toe
  starting_player = who_goes_first

  score = initialize_score

  play_match(score, starting_player)

  system 'clear'
  winner = detect_match_winner(score)
  prompt("It looks like #{winner} has won the match!")
  prompt("The final score was #{score["Player"]} games to #{score["Computer"]}")

  play_again?('match') ? score = initialize_score : break
end

# Implementing the minimax algorithm

# create the game tree
1. build the state tree passing in the board in its current state
  - calculate the computers available moves for current turn
  - if move results in win, tie, or loss score the move
  - otherwise, calculate the moves for the player
  - score again
  - continue until a score is returned
