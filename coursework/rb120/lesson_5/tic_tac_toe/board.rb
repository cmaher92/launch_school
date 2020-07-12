require_relative 'drawable'
require_relative 'square'
require 'pry'

module Tictactoe
  class Board
    include Drawable
    attr_reader :middle_square, :winner
    attr_accessor :locations_unmarked, :board, :current_player_marker

    LOCATIONS_UNMARKED = [
      [0, 0], [0, 1], [0, 2],
      [1, 0], [1, 1], [1, 2],
      [2, 0], [2, 1], [2, 2]
    ]
    NUMBER_OF_SQUARES = 9

    def initialize(human_marker, computer_marker)
      @human_marker = human_marker
      @computer_marker = computer_marker
      @number_of_squares = NUMBER_OF_SQUARES
      @locations_unmarked = LOCATIONS_UNMARKED
      @board = build_board
      @middle_square = [1,1]
    end

    def number_of_unmarked
      @board.flatten.select(&:unmarked?).size
    end

    def number_of_marked
      @board.flatten.select(&:marked?).size
    end

    def winner_exists?
      !!@winner
    end

    def find_best_move
      minimax(number_of_unmarked)
      @move
    end

    def check_for_winner
      return if number_of_marked < 5
      @winner = check_rows || check_columns || check_diagonal || check_reverse_diagonal
    end

    def positions_unmarked
      @board.flatten.select { |square| square.unmarked? }.map { |square| square.position }
    end

    def finished?
      !!@winner || draw?
    end

    def draw?
      number_of_unmarked == 0 && !@winner
    end

    def mark_square(location)
      @board[location.first][location.last].marker = @current_player_marker
      @locations_unmarked.delete(location)
      check_for_winner
      swap_turns
    end

    def square_available?(location)
      @board[location.first][location.last].unmarked?
    end

    def minimax(depth)
      return score if finished? || depth == 0
      children = []
      moves = @locations_unmarked
      scores = []

      @locations_unmarked.each do |move|
        child_board = get_new_state
        child_board.mark_square(move)
        children << child_board
      end

      if @current_player_marker == @computer_marker
        children.each do |child|
          scores << child.minimax(child.number_of_unmarked)
        end
        scores << -9
        @move = moves[scores.index(scores.max)]
        scores.max
      else
        children.each do |child|
          scores << child.minimax(child.number_of_unmarked)
        end
        scores << 9
        @move = moves[scores.index(scores.min)]
        scores.min
      end
    end

    private

    def active_board?
      !!@active_board
    end

    def contents_of(location)
      @board[location.first][location.last].marker
    end

    def unmarked_squares
      @board.flatten.select(&:unmarked?)
    end

    def marked_squares
      @board.flatten.select(&:marked?)
    end

    def score
      if @winner == @computer_marker
        1
      elsif @winner == @human_marker
        -1
      else
        0
      end
    end

    def get_new_state
     board = Board.new(@human_marker, @computer_marker)
     board.current_player_marker = @current_player_marker
     board.locations_unmarked = @locations_unmarked.map(&:dup)
     board.board = @board.map { |row| row.map(&:dup) }
     board
    end

    def check_rows
      @board.size.times do |row_index|
        candidate = check_line([row_index, 0]) { |index| [row_index, index] }
        return candidate if candidate
      end
      nil
    end

    def check_columns
      @board.size.times do |col_index|
        candidate = check_line([0, col_index]) { |index| [index, col_index]}
        return candidate if candidate
      end
      nil
    end

    def check_diagonal
      check_line([0,0]) { |index| [index, index] }
    end

    def check_reverse_diagonal
      max_index = @board.size - 1
      check_line([0,max_index]) { |index| [index, max_index - index] }
    end

    def check_line(starting_location)
      # retrieve marker from given location, set as candidate
      candidate = contents_of(starting_location)
      return if candidate.nil?

      # retrieve remaining squares from this line and check if they're the same as first
      (1..@board.size - 1).each do |index|
        square_location = yield index
        square_marker = contents_of(square_location)
        return if square_marker != candidate # if this square doesn't have same marker, its not a winning line
      end

      # if all three markers in line were the same, return marker
      candidate
    end

    def build_board
      squares = (1..NUMBER_OF_SQUARES).map { |pos| Square.new(pos) }
      @board = Array.new(3) { Array.new(3) { squares.shift } }
    end

    def swap_turns
      if @current_player_marker == @human_marker
        @current_player_marker = @computer_marker
      else
        @current_player_marker = @human_marker
      end
    end

  end
end
