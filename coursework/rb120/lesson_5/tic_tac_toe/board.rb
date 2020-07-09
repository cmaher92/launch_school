module Tictactoe
  class Board
    UNMARKED_POSITIONS = [
      [0, 0], [0, 1], [0, 2],
      [1, 0], [1, 1], [1, 2],
      [2, 0], [2, 1], [2, 2]
    ]

    def initialize
      @number_of_squares = 9
      @number_of_marked = 0
      @number_of_unmarked = 9
      @available_moves = UNMARKED_POSITIONS
      @board = build_board
    end

    def place_piece
      # TODO
    end

    def draw
      # TODO
    end

    def blank?
      # TODO
    end

    def contents_of(position)
      # TODO
    end

    private

    def build_board
      board = Array.new(3) { Array.new(3) { Square.new } }
    end

  end

  class Square
    attr_accessor :marker

    def to_s
      if marker == 'X'
        Paint['X', '#00cc66', :bold]
      elsif marker == 'O'
        Paint['O', '#bf0603', :bold]
      else
        " "
      end
    end
  end
end
