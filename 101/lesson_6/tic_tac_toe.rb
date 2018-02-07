require 'pry'
require_relative 'joinor'
require_relative 'computer_turn'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

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

loop do
  # start of a match
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
  score = initialize_score

  loop do
    # start of game
    current_player = starting_player
    board = initialize_board

    loop do
      # each loop display's the board
      # places a piece on the board
      # checks to see if somebody won or the board is full
      # if the board is full, or there is a winner it breaks from this loop
      display_board(board, score)
      current_player = place_piece!(board, current_player)
      break if !!someone_won?(board) || board_full?(board)
    end

    # display who won, updates score hash
    if someone_won?(board)
      winner = detect_winner(board)
      update_score!(score, winner)
      display_board(board, score)
      prompt("#{winner} won!")
    else
      display_board(board, score)
      prompt "It's a tie!"
    end

    sleep(3)
    break if score.values.any? { |total| total == 5 }
  end

  system 'clear'
  winner = detect_match_winner(score)
  prompt("It looks like #{winner} has won the match!")
  prompt("The final score was #{score["Player"]} games to #{score["Computer"]}")

  play_again? ? score = initialize_score : break
end

# TO_DO:
  # check to see if changing the constant manually works
    # it doesn't, why? Fix it.
    # it actually was working, I just wasn't displaying the board after the
    # computer went first, fixed this by displaying the board promptly after
    # the computer goes so the user has a chance to see where the computer
    # went.
  # abstract unnecessary logic into methods
    # modifying the current_player is not sticking, something to do with scoping
    # yep, so #[] method with Hash's is mutating, meaning that it changes the contents
    # of the Hash without changing the object_id.
    # The #= method with a String is not-mutating, so after the method is ran
    # the String remaings unchanged
    # The solution is to save the return value from the method as current_player
    # then the next iteration of the loop, current_player is properly updated within
    # the game loop. This still will not modify the current_player outside the game loop.
  # fix the display when somebody wins or there is a tie, it's not currently showing up
    # The issue occurred when I removed the prompt which asked the user if they wanted to
    # play again after each game
  # see if I need to pass the score around, it's a hash just like the board, why not just
    # modify and reset after each new match
    # I don't need to pass the score around, when modifying the score for each player I'm
    # reassigning an object within the score, which is mutating the score not creating a
    # whole new Hash.
  # set up the option to choose who goes first each game


# Feature backlog:
  # if somebody wins the game, the loser get's the opportunity to go first
  # fix the games/game issue, if the player has won a single game it should say 'game'
  # incorporate joinor.rb and computer.rb back into the main tic_tac_toe file
  # abstract the match loop, game loop, and turn loop into their own functions
  #
