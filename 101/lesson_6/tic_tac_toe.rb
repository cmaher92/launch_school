require 'pry'

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

# rubocop:disable Metrics/AbcSize
def display_board(b)
  system 'clear'
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
    prompt("Square #{empty_squares(b).join(', ')} are available")
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

# main gameplay logic
loop do
  board = initialize_board

  loop do
    display_board(board)
    user_turn!(board)
    break if someone_won?(board) || board_full?(board)
    computer_turn!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  prompt('Do you want to play again? (y/n)')
  choice = gets.chomp.downcase
  break if choice == 'n'
end
