require 'paint'

module Displayable
  EMPTY_SPACE = ""

  def display_score
    puts "You have #{@human.wins} wins. Computer has #{@computer.wins} wins."
  end

  def display_match_winner
    if @human.wins == 5
      puts "You won the match!"
    else
      puts "Sorry, you lost the match."
    end
  end

  def display_welcome_message
    clear
    puts "Welcome to Tic-Tac-Toe!"
  end

  def display_goodbye_message
    clear
    puts EMPTY_SPACE
    puts "Thanks for playing!"
  end

  def display_board_without_positions
    display_score
    puts EMPTY_SPACE
    @board.draw_without_positions
    puts EMPTY_SPACE
  end

  def display_board_with_positions
    puts EMPTY_SPACE
    @board.draw_with_positions
    puts EMPTY_SPACE
  end

  def display_result
    case @board.winning_marker
    when TTTGame::HUMAN_MARKER
      puts "Congratulations, you won!"
    when TTTGame::COMPUTER_MARKER
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

  def draw_with_positions
    puts [
      EMPTY_LINE, draw_line(1), MID_LINE,
      EMPTY_LINE, draw_line(2), MID_LINE,
      EMPTY_LINE, draw_line(3), EMPTY_LINE
    ]
  end

  def draw_without_positions
    puts [
      EMPTY_LINE, draw_line(1, false), MID_LINE,
      EMPTY_LINE, draw_line(2, false), MID_LINE,
      EMPTY_LINE, draw_line(3, false), EMPTY_LINE
    ]
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

  def immediate_opportunity
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      # if 2 'X's and 1 unmarked return position of unmarked
      if squares.count(&:o?) == 2 && squares.count(&:unmarked?) == 1
        return squares.detect(&:unmarked?).position
      else
        next
      end
    end
    nil
  end

  def immediate_threat
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      # if 2 'X's and 1 unmarked return position of unmarked
      if squares.count(&:x?) == 2 && squares.count(&:unmarked?) == 1
        return squares.detect(&:unmarked?).position
      else
        next
      end
    end
    nil
  end

  def winning_marker
    WINNING_LINES.each do |line|
      marks = @squares.values_at(*line).select(&:marked?).map(&:mark)
      next if marks.size != 3
      return marks.first if marks.all? { |mark| marks.first == mark }
    end
    nil
  end

  private

  def draw_line(line_number, with_positions = true)
    if with_positions
      squares = @squares.map { |pos, sq| sq.marked? ? sq : pos }
    else
      squares = @squares.map { |pos, sq| sq.marked? ? sq : " " }
    end
    if line_number == 1
      format("  %s  |  %s  |  %s  ", squares[0], squares[1], squares[2])
    elsif line_number == 2
      format("  %s  |  %s  |  %s  ", squares[3], squares[4], squares[5])
    elsif line_number == 3
      format("  %s  |  %s  |  %s  ", squares[6], squares[7], squares[8])
    end
  end
end

class Square
  attr_reader :position
  attr_accessor :mark

  def initialize(position)
    @position = position
  end

  def x?
    mark == 'X'
  end

  def o?
    mark == 'O'
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
    else @mark == 'O'
      Paint['O', '#bf0603', :bold]
    end
  end
end

Player = Struct.new(:marker, :wins)

class TTTGame
  include Displayable
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  FIRST_TO_MOVE = 'choose'

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER, 0)
    @computer = Player.new(COMPUTER_MARKER, 0)
    @current_marker = set_current_marker
  end

  def play
    display_welcome_message
    loop do
      puts "First to 5 points is the winner."
      main_game
      clear
      display_match_winner
      play_another? ? reset_match : break
    end
    display_goodbye_message
  end


  private

  def set_current_marker
    if FIRST_TO_MOVE == 'choose'
      choose
    else
      @current_marker = FIRST_TO_MOVE
    end
  end

  def choose
    choice = ''
    loop do
      puts "Would you like to go first? (y/n)"
      choice = gets.chomp.downcase
      break if ['y', 'n', 'yes', 'no'].include?(choice)
      puts "Invalid option, try again"
    end
    @current_marker = ['y', 'yes'].include?(choice) ? HUMAN_MARKER : COMPUTER_MARKER
  end

  def reset_match
    reset
    reset_score
  end

  def reset_score
    @human.wins = 0
    @computer.wins = 0
  end

  def match_winner?
    @human.wins == 5 || @computer.wins == 5
  end

  def joiner(arr, seperator)
    return arr[0].to_s if arr.size == 1
    return "#{arr[0]} or #{arr[1]}" if arr.size == 2
    arr.insert(-2, 'or').map do |e|
      arr[-2..-1].include?(e) ? e : "#{e}#{seperator}"
    end.join(' ')
  end

  def main_game
    loop do
      player_move
      display_result
      display_board_without_positions
      break if match_winner?
      if play_another?
        clear
        reset
      else
        break
      end
    end
  end

  def player_move
    loop do
      current_player_moves
      break if @board.full? || @board.winner?
    end
    add_win if @board.winner?
  end

  def add_win
    if @human.marker == @board.winning_marker
      @human.wins += 1
    else
      @computer.wins += 1
    end
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def human_moves
    display_board_with_positions
    choice = nil
    loop do
      puts "Please choose a square (#{joiner(@board.unmarked_positions, ',')}):"
      choice = gets.chomp.to_i
      break if @board.unmarked_positions.include?(choice)
      puts "Invalid choice, try again."
    end
    clear
    @board[choice] = @human.marker
  end

  def computer_moves
    if @board.immediate_opportunity
      @board[@board.immediate_opportunity] = @computer.marker
    elsif @board.immediate_threat
      @board[@board.immediate_threat] = @computer.marker
    elsif @board.unmarked_positions.include?(5)
      @board[5] = @computer.marker
    else
      @board[@board.unmarked_positions.sample] = @computer.marker
    end
  end

  def play_another?
    if match_winner?
      puts "Would you like to play another match? (y/n)"
    else
      puts "Would you like to keep playing? (y/n)"
    end

    response = nil
    loop do
      response = gets.chomp.downcase
      break if ['yes', 'y', 'n', 'no'].include?(response)
      puts "Invalid response, try again."
    end
    ['yes', 'y'].include?(response)
  end

  def reset
    clear
    puts "Great!, let's play again!"
    @current_marker = FIRST_TO_MOVE
    @board.reset
  end

  def clear
    system 'clear'
  end
end

TTTGame.new.play
