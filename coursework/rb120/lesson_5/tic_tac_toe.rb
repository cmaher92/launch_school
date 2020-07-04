require 'pry'
require 'paint'

module Displayable
  EMPTY_SPACE = ""

  def display_goodbye_message
    puts EMPTY_SPACE
    puts "Thank you for playing!"
  end

  def display_board
    puts EMPTY_SPACE
    board.draw
    puts EMPTY_SPACE
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

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].mark = marker
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
    unmarked_positions.count == 0
  end

  def unmarked_positions
    @squares.keys.select { |key| @squares[key].unmarked? }
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

  def marked?
    !!@mark
  end

  def unmarked?
    @mark.nil?
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
    display_board
    choice = nil
    loop do
      puts "Please choose a square (#{board.unmarked_positions.join(', ')}):"
      choice = gets.chomp.to_i
      break if board.unmarked_positions.include?(choice)
      puts "Invalid choice, try again."
    end
    clear
    board[choice] = human.marker
    @current_player = computer
  end

  def computer_turn
    board[board.unmarked_positions.sample] = computer.marker
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
