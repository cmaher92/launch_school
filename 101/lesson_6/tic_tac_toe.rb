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

def initialize_board
  board = {}
  1.upto(9) do |i|
    board[i] = INITIAL_MARKER
  end
  board
end

def initialize_score
  score = {"Player" => 0, "Computer" => 0}
end

def update_score(score, winner)
  score[winner] += 1
  score
end

# rubocop:disable Metrics/AbcSize
def display_board(b, score)
  system 'clear'
  puts "You're #{USER_MARKER}. Computer is #{CPU_MARKER}."
  puts "You have won #{score["Player"]} games"
  puts "The computer has won #{score["Computer"]} games"
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

loop do
  # start of a series
  score = initialize_score

  loop do
    board = initialize_board

    loop do
      display_board(board, score)
      user_turn!(board)
      # binding.pry
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
      prompt("The score is:")
      prompt("Player: #{score["Player"]}, to Computer: #{score["Computer"]}")
    else
      prompt "It's a tie!"
    end

    break if score.values.any? { |score| score == 5 }
  end

  system 'clear'
  # need to ask the player if he wants to play another match
  winner = score.select { |k, v| k if v == 5 }.to_a[0][0]
  prompt("It looks like #{winner} has won the match!")
  prompt('Do you want to play another match? (y/n)')
  choice = gets.chomp.downcase
  if choice == 'n'
    break
  else
    score = initialize_score
    next
  end
end
# Keep score
# No global or constant variables

# initalize_score at beginning of new series
# once somebody has won, update the score
# display the score at the end of each game
# break once somebody has 5 wins
