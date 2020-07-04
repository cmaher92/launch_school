require 'pry'
require 'paint'

module Displayable
  EMPTY_SPACE = ""

  def display_goodbye_message
    puts EMPTY_SPACE
    puts "Thank you for playing!"
  end

  def display_board
    board.draw
  end

  def display_result
    case board.winning_marker
    when 'X'
      puts "Congratulations #{human.name}, you won!"
    when 'O'
      puts "Sorry, you lost!"
    else
      puts "It looks like it was a tie!"
    end
  end
end

class Board
  EMPTY_LINE = "     |     |     "
  MID_LINE   = "_____|_____|_____"
  WINNING_LINES = [
    [1, 5, 9],
    [3, 5, 7],
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9]
  ]

  # TODO: we don't want to provide access to squares, only the board should be aware of the Square class
  attr_accessor :squares

  def initialize
    @squares = {}
    reset
  end

  def draw
    puts [
      EMPTY_LINE, draw_line(1), MID_LINE,
      EMPTY_LINE, draw_line(2), MID_LINE,
      EMPTY_LINE, draw_line(3), EMPTY_LINE
    ]
  end

  def draw_line(line_number)
    if line_number == 1
      format("  %s  |  %s  |  %s  ", @squares[1], @squares[2], @squares[3])
    elsif line_number == 2
      format("  %s  |  %s  |  %s  ", @squares[4], @squares[5], @squares[6])
    elsif line_number == 3
      format("  %s  |  %s  |  %s  ", @squares[7], @squares[8], @squares[9])
    end
  end

  def reset
    (1..9).each { |position| @squares[position] = Square.new(position) }
  end

  def full?
    available_squares.empty?
  end

  def available_squares
    squares.select { |_, square| square.available? }.values
  end

  def winner?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |keys|
      line = keys.map { |key| @squares[key] }
      return 'X' if line.all? { |square| square.mark == 'X' }
      return 'O' if line.all? { |square| square.mark == 'O' }
    end
    nil
  end
end

class Square
  attr_accessor :mark

  def initialize(position)
    @position = position
  end

  # change to #marked?, also add #unmarked?
  def available?
    !@mark
  end

  def to_s
    if @mark == 'X'
      Paint['X', '#00cc66', :bold]
    elsif @mark == 'O'
      Paint['O', '#bf0603', :bold]
    else
      @position.to_s
    end
  end
end

class Computer
  attr_reader :marker

  def initialize
    @marker = 'O'
  end
end

class Human
  attr_accessor :name
  attr_reader :marker

  def initialize
    @marker = 'X'
    set_name
  end

  private

  def set_name
    puts "Welcome to Tic-Tac-Toe!"
    name = nil
    loop do
      puts "What's your name?"
      name = gets.chomp
      break if /[A-Za-z]/ =~ name
      puts "Your name must contain at least one character, try again."
    end
    @name = name
  end
end

class TTTGame
  include Displayable
  attr_reader :board, :human, :computer
  STARTING_PLAYER = 'Human' # Other option is 'Computer'

  def initialize
    clear
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
  end

  def play
    # TODO: clear screen here, then request player name here
    # TODO: differentiate between displaying board and displaying board and clearing screen
    loop do
      
      loop do
      player_turn
      break if board.full? || board.winner?
      end

      clear
      display_board
      display_result

      play_again? ? reset : break
    end

    display_goodbye_message
  end

  private

  def current_player
    if STARTING_PLAYER == 'Human'
      @current_player = human
    else
      @current_player = computer
    end
  end

  def player_turn
    current_player if @current_player.nil?
    if @current_player.is_a?(Human)
      human_turn
    else
      computer_turn
    end
  end

  def human_turn
    puts "Here are the available options:"
    display_board
    choice = nil
    loop do
      puts "Please select an available square:"
      choice = gets.chomp.to_i
      # TODO: Compare this to how LS used Board#unmarked_keys followed by a called to #include?
      break if choice.between?(1, 9) && board.squares[choice].available?
      puts "Invalid choice, try again."
    end
    square = board.squares[choice]
    # TODO: Use the #[]= method that LS defines in their Board class as it seems to be less dependent on knowing
    #              what a square is
    square.mark = human.marker
    @current_player = computer
    # TODO: keep clear out of methods, it should only be in the game loop
    clear
  end

  def computer_turn
    square = board.available_squares.sample
    # TODO: Use the #[]= method
    square.mark = computer.marker
    @current_player = human
  end

  def play_again?
    response = nil
    loop do
      puts "Would you like to play again? (y/n)"
      response = gets.chomp.downcase
      break if ['yes', 'y', 'n', 'no'].include?(response)
      puts "Invalid response, try again."
    end
    ['yes', 'y'].include?(response)
  end

  # TODO: adjust player_turn to reflect how LS sets who goes first, it makes more sense
  def reset
    clear
    puts "Great!, let's play again!"
    player_turn
    board.reset
  end

  def clear
    system 'clear'
  end
end

TTTGame.new.play
