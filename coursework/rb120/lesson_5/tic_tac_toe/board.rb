require_relative 'displayable'
require_relative 'square'

module Tictactoe
  class Board
    include Displayable
    attr_reader :number_of_marked, :number_of_unmarked
    UNMARKED_POSITIONS = [
      [0, 0], [0, 1], [0, 2],
      [1, 0], [1, 1], [1, 2],
      [2, 0], [2, 1], [2, 2]
    ]

    def initialize
      @number_of_squares = 9
      @number_of_marked = 0
      @number_of_unmarked = 9
      @unmarked_positions = UNMARKED_POSITIONS
      @board = build_board
    end

    def mark_square(marker, position)
      @board[position.first][position.last].marker = marker
      @number_of_unmarked -= 1
      @number_of_marked += 1
      @unmarked_positions.delete(position)
      self
    end
    
    def blank?
      number_of_squares == number_of_marked
    end

    def contents_of(position)
      @board[position.first][position.last].marker
    end

    private

    def build_board
      board = Array.new(3) { Array.new(3) { Square.new } }
    end
  end
end
