require 'pry'
require 'paint'

module Displayable
  EMPTY_SPACE = ""

  def display_welcome_message
    puts "Welcome to Tic Tac Toe, #{human.name}"
  end

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

  attr_accessor :squares

  def initialize
    @squares = hash_of_squares
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
    @squares = hash_of_squares
  end

  def full?
    available_squares.empty?
  end

  def get_square_at(key)
    @squares[key]
  end

  def set_square_at(key, marker)
    @squares[key].mark = marker
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

  private

  def hash_of_squares
    hash_of_squares = {}
    9.times { |num| hash_of_squares[num + 1] = Square.new(num + 1) }
    hash_of_squares
  end
end

class Square
  attr_accessor :mark

  def initialize(position)
    @position = position
  end

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

class Player
  attr_reader :name, :marker
end

class Computer < Player
  def initialize
    @marker = 'O'
    @name = 'R2D2'
  end
end

class Human < Player
  def initialize
    @name = set_name
    @marker = 'X'
  end

  private

  def set_name
    puts "What's your name?"
    @name = gets.chomp
  end
end

class TTTGame
  include Displayable
  attr_reader :board, :human, :computer

  def initialize
    clear
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    clear
  end

  def play
    display_welcome_message

    loop do
      play_turns

      clear
      display_board
      display_result

      play_again? ? reset : break
    end

    display_goodbye_message
  end

  private

  def play_turns
    loop do
      puts 'Here are the available choices:'
      display_board
      human_turn
      break if board.full? || board.winner?

      computer_turn
      break if board.full? || board.winner?
      clear
    end
  end

  def human_turn
    choice = nil
    loop do
      puts "Please select an available square:"
      choice = gets.chomp.to_i
      break if choice.between?(1, 9) && board.squares[choice].available?
      puts "Invalid choice, try again."
    end
    board.set_square_at(choice, human.marker)
  end

  def computer_turn
    square = board.available_squares.sample
    square.mark = computer.marker
  end

  def play_again?
    response = nil
    loop do
      puts "Would you like to play again?"
      puts "(y)es/(n)o"
      response = gets.chomp
      break if ['yes', 'y', 'n', 'no'].include?(response)
      puts "Invalid response, try again."
    end
    ['yes', 'y'].include?(response)
  end

  def reset
    clear
    puts "Great!, let's play again!"
    board.reset
  end

  def clear
    system 'clear'
  end
end

TTTGame.new.play
