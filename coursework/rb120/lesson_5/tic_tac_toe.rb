require 'pry'
require 'paint'

module Displayable
  EMPTY_SPACE = ""
  EMPTY_LINE = "     |     |     "
  MID_LINE   = "_____|_____|_____"

  def display_welcome_message
    puts("Welcome to Tic Tac Toe, #{human.name}")
  end

  def display_goodbye_message
    puts EMPTY_SPACE
    puts "Thank you for playing!"
  end

  def display_board_with_choices
    puts 'Here are the available choices:'
    display_board
  end

  private

  def display_board
    content = build_content_lines
    [
      EMPTY_LINE, content[0], MID_LINE,
      EMPTY_LINE, content[1], MID_LINE,
      EMPTY_LINE, content[2], EMPTY_LINE
    ].each { |line| puts line }
  end

  def build_content_lines
    marks = format_squares
    content = []
    3.times { content << format("  %s  |  %s  |  %s  ", *marks.shift(3)) }
    content
  end

  def format_squares
    board.squares.map do |key, square|
      if square.mark == ' '
        key
      elsif square.mark == 'X'
        Paint['X', '#00cc66', :bold]
      else
        Paint['O', '#bf0603', :bold]
      end
    end
  end
end

class Board
  attr_reader :squares

  def initialize
    @squares = {}
    9.times { |num| @squares[num + 1] = Square.new }
    set_lines
  end

  def reset
    @squares = {}
    9.times { |num| @squares[num + 1] = Square.new }
    set_lines
    system('clear')
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
    !!detect_winner
  end

  def detect_winner
    @lines.each do |line|
      return 'X' if line.all? { |square| square.mark == 'X' }
      return 'O' if line.all? { |square| square.mark == 'O' }
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
      loop do
        display_board_with_choices
        human_turn
        break if board.full? || board.winner?

        computer_turn
        break if board.full? || board.winner?
        system('clear')
      end

      system('clear')
      display_board_with_choices

      # remove this from #play method
      case board.detect_winner
      when 'X'
        puts "Congratulations #{human.name}, you won!"
      when 'O'
        puts "Sorry, you lost!"
      else
        puts "It looks like it was a tie!"
      end

      break if !play_again?
      board.reset
      puts "Great!, let's play again!"
    end
    display_goodbye_message
  end

  private

  def human_turn
    choice = nil
    loop do
      puts "Please select an available square:"
      choice = gets.chomp.to_i
      break if (1..9) === choice && board.get_square_at(choice).available?
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
      break if valid_response?(response, ['yes', 'y', 'n', 'no'])
      puts "Invalid response, try again."
    end
    ['yes', 'y'].include?(response)
  end

  def valid_response?(response, valid_responses)
    valid_responses.include?(response)
  end
end

TTTGame.new.play
