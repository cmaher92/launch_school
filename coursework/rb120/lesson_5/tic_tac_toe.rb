require 'pry'

module Displayable
  EMPTY_SPACE = ""
  EMPTY_LINE = "     |     |     "
  MID_LINE   = "_____|_____|_____"

  def display_board
    puts EMPTY_SPACE
    puts EMPTY_LINE
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.get_square_at(3)}  "
    puts MID_LINE
    puts EMPTY_LINE
    puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.get_square_at(6)}  "
    puts MID_LINE
    puts EMPTY_LINE
    puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.get_square_at(9)}  "
    puts EMPTY_LINE
  end

  def display_welcome_message
    system("clear")
    puts "Welcome to Tic Tac Toe, #{human.name}"
  end

  def display_goodbye_message
    puts EMPTY_SPACE
    puts "Thank you for playing!"
  end

  def display_choices
    puts "Here are the available choices:"
    squares = board.squares.map { |key, square| square.mark == ' ' ? key : square.mark }
    puts EMPTY_SPACE
    puts EMPTY_LINE
    puts "  #{squares[0]}  |  #{squares[1]}  |  #{squares[2]}  "
    puts MID_LINE
    puts EMPTY_LINE
    puts "  #{squares[3]}  |  #{squares[4]}  |  #{squares[5]}  "
    puts MID_LINE
    puts EMPTY_LINE
    puts "  #{squares[6]}  |  #{squares[7]}  |  #{squares[8]}  "
    puts EMPTY_LINE
    puts EMPTY_SPACE
  end
end

class Board
  attr_reader :squares

  def initialize
    @squares = {
      1 => Square.new,
      2 => Square.new,
      3 => Square.new,
      4 => Square.new,
      5 => Square.new,
      6 => Square.new,
      7 => Square.new,
      8 => Square.new,
      9 => Square.new
    }

    set_lines
  end

  def full?
    get_available_squares.empty?
  end

  def get_square_at(key)
    @squares[key]
  end

  def set_square_at(key, marker)
    @squares[key].mark = marker
  end

  def get_available_squares
    squares.select { |key, square| square.available? }.map { |k, v| v }
  end

  def winner?
    !!detect_winner
  end

  def detect_winner
    @lines.each do |line|
      if line.all? { |square| square.mark == 'X' }
        return 'X'
      elsif line.all? { |square| square.mark == 'O' }
        return 'O'
      end
    end
    nil
  end

  private

  def set_lines
    @lines = [squares[1], squares[5], squares[9]],
    [squares[3], squares[5], squares[7]],
    [squares[1], squares[2], squares[3]],
    [squares[4], squares[5], squares[6]],
    [squares[7], squares[8], squares[9]],
    [squares[1], squares[4], squares[7]],
    [squares[2], squares[5], squares[8]],
    [squares[3], squares[6], squares[9]]
  end
end

class Square
  attr_accessor :mark

  def initialize
    @mark = ' '
  end

  def available?
    @mark == ' '
  end

  def to_s
    @mark
  end
end

class Player
  attr_reader :name, :marker

  def initialize
    # maybe a "marker" to keep track of this player's symbol (ie, 'X' or 'O')
  end
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
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message
    loop do
      human_turn
      break if board.full? || board.winner?

      computer_turn
      break if board.full? || board.winner?

      display_board
    end
    case board.detect_winner
    when 'X'
      puts "Congratulations #{human.name}, you won!"
    when 'O'
      puts "Sorry, you lost!"
    else
      puts "It looks like it was a tie!"
    end
    display_goodbye_message
  end

  private

  def human_turn
    choice = nil
    loop do
      display_choices
      puts "Please select an available square:"
      choice = gets.chomp.to_i
      break if (1..9) === choice && board.get_square_at(choice).available?
      puts "Invalid choice, try again."
    end
    board.set_square_at(choice, human.marker)
  end

  def computer_turn
    square = board.get_available_squares.sample
    square.mark = computer.marker
  end
end

TTTGame.new.play
