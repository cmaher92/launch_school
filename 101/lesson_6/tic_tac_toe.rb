require 'pry'
require_relative 'joinor'

INITIAL_MARKER = ' '
USER_MARKER = 'X'
CPU_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

def play_again?
  prompt('Would you like to play again? (y/n)')
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

def update_score(score, winner)
  score[winner] += 1
  score
end

# rubocop:disable Metrics/AbcSize
def display_board(b, score)
  system 'clear'
  puts "You're #{USER_MARKER}. Computer is #{CPU_MARKER}."
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

def empty_squares(b)
  # finds the keys where the value in the board hash
  # is equivalent to the INITIAL_MARKER
  b.keys.select { |k| b[k] == INITIAL_MARKER }
end

def user_turn!(b)
  square = ''
  loop do
    prompt("Please select where you want to place your piece")
    # binding.pry
    prompt("Squares #{joinor(empty_squares(b), ', ', 'and')} are available")
    square = gets.chomp.to_i
    break if empty_squares(b).include?(square)
    prompt("That's an invalid choice.")
  end
  b[square] = USER_MARKER
  b
end

def computer_turn!(b)
  # randomly selects a square to place a piece based on what is available
  # empty_squares returns an array of keys representing the empty squares
  # on the board
  choice = empty_squares(b).sample
  b[choice] = CPU_MARKER
end

def board_full?(b)
  # returns true when there are no more empty squares
  # check to see if b.empty_squares is empty
  empty_squares(b).empty? == true
end

def someone_won?(b)
  # returns a boolean
  # saves the winner into a variable which is used to update the score
  !!detect_winner(b)
end

def detect_winner(b)
  WINNING_LINES.each do |line|
    if [b[line[0]], b[line[1]], b[line[2]]].all? { |m| m == USER_MARKER }
      return 'Player'
    elsif [b[line[0]], b[line[1]], b[line[2]]].all? { |m| m == CPU_MARKER }
      return 'Computer'
    end
  end
  nil
end

def detect_match_winner(s)
  s.select { |k, v| k if v == 5 }.to_a[0][0]
end

loop do
  # start of a match
  score = initialize_score

  loop do
    # start of game
    board = initialize_board

    loop do
      display_board(board, score)
      user_turn!(board)
      break if !!someone_won?(board) || board_full?(board)
      computer_turn!(board)
      break if !!someone_won?(board) || board_full?(board)
    end

    display_board(board, score)

    # display's who won
    if someone_won?(board)
      winner = detect_winner(board)
      prompt("#{winner} won!")
      score = update_score(score, winner)
    else
      prompt "It's a tie!"
    end

    break if score.values.any? { |total| total == 5 }
  end

  system 'clear'
  winner = detect_match_winner(score)
  prompt("It looks like #{winner} has won the match!")
  prompt("The final score was #{score["Player"]} games to #{score["Computer"]}")

  play_again? ? score = initialize_score : break
end
