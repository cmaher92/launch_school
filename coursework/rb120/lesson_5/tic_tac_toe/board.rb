require_relative 'drawable'
require_relative 'square'

module Tictactoe
  class Board
    include Drawable
    attr_reader :number_of_marked, :number_of_unmarked, :locations_unmarked,
                :current_player_marker, :starting_player_marker, :middle_square
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
      @number_of_marked = 0
      @number_of_unmarked = 9
      @locations_unmarked = LOCATIONS_UNMARKED
      @board = build_board
      @middle_square = [1,1]
    end

    def positions_unmarked
      @board.flatten.select { |square| square.unmarked? }.map { |square| square.position }
    end

    def to_a
      @board.flatten
    end

    def finished?
      @winner || draw?
    end

    def draw?
      number_of_unmarked == 0 && !@winner
    end

    def current_player_marker=(marker)
      @current_player_marker = marker
      @starting_player_marker = marker if @starting_player_marker.nil?
    end

    def mark_square(marker, location)
      @board[location.first][location.last].marker = marker
      @number_of_unmarked -= 1
      @number_of_marked += 1
      @locations_unmarked.delete(location)
      swap_turns
      self
    end

    def empty?
      number_of_squares == number_of_unmarked
    end

    def contents_of(location)
      @board[location.first][location.last].marker
    end

    def square_available?(location)
      @board[location.first][location.last].unmarked?
    end

    private

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
