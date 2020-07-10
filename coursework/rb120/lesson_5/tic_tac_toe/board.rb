require_relative 'displayable'
require_relative 'square'

module Tictactoe
  class Board
    include Displayable
    attr_reader :number_of_marked, :number_of_unmarked, :locations_unmarked, :positions
    LOCATIONS_UNMARKED = [
      [0, 0], [0, 1], [0, 2],
      [1, 0], [1, 1], [1, 2],
      [2, 0], [2, 1], [2, 2]
    ]

    def initialize
      @number_of_squares = 9
      @number_of_marked = 0
      @number_of_unmarked = 9
      @locations_unmarked = LOCATIONS_UNMARKED
      @positions = (1..@number_of_squares).to_a
      @board = build_board
    end
 
    def mark_square(marker, location)
      @board[location.first][location.last].marker = marker
      @number_of_unmarked -= 1
      @number_of_marked += 1
      @locations_unmarked.delete(location)
      self
    end
    
    def empty?
      number_of_squares == number_of_unmarked
    end

    def contents_of(location)
      @board[location.first][location.last].marker
    end

    private
    
    def build_board
      positions = @positions
      board = Array.new(3) { Array.new(3) { Square.new(positions.shift) } }
    end
  end
end
