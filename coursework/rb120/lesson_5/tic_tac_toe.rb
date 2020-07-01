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
    display_board
  end

  def display_result
    case board.detect_winner
    when 'X'
      puts "Congratulations #{human.name}, you won!"
    when 'O'
      puts "Sorry, you lost!"
    else
      puts "It looks like it was a tie!"
    end
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

  attr_reader :squares

  def initialize
    @squares = {}
    9.times { |num| @squares[num + 1] = Square.new }
  end

  def reset
    @squares = {}
    9.times { |num| @squares[num + 1] = Square.new }
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
    system('clear')
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    system('clear')
  end

  def play
    display_welcome_message

    loop do
      play_turns

      system('clear')
      display_board_with_choices
      display_result

      play_again? ? reset_board : break
    end

    display_goodbye_message
  end

  private

  def reset_board
    system('clear')
    puts "Great!, let's play again!"
    board.reset
  end

  def play_turns
    loop do
      puts 'Here are the available choices:'
      display_board_with_choices
      human_turn
      break if board.full? || board.winner?

      computer_turn
      break if board.full? || board.winner?
      system('clear')
    end
  end

  def human_turn
    choice = nil
    loop do
      puts "Please select an available square:"
      choice = gets.chomp.to_i
      break if choice.between?(1, 9) && board.get_square_at(choice).available?
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
