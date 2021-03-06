module Tictactoe
  module Drawable
    EMPTY_LINE = "     |     |     "
    MID_LINE   = "_____|_____|_____"

    def draw
      puts EMPTY_LINE
      puts format("  %s  |  %s  |  %s  ", *@board[0])
      puts MID_LINE
      puts EMPTY_LINE
      puts format("  %s  |  %s  |  %s  ", *@board[1])
      puts MID_LINE
      puts EMPTY_LINE
      puts format("  %s  |  %s  |  %s  ", *@board[2])
      puts EMPTY_LINE
    end

    def draw_with_positions
      board = markers_and_positions
      puts EMPTY_LINE
      puts format("  %s  |  %s  |  %s  ", *board[0, 3])
      puts MID_LINE
      puts EMPTY_LINE
      puts format("  %s  |  %s  |  %s  ", *board[3, 3])
      puts MID_LINE
      puts EMPTY_LINE
      puts format("  %s  |  %s  |  %s  ", *board[6, 3])
      puts EMPTY_LINE
    end

    def markers_and_positions
      @board.flatten.map { |square| square.marked? ? square : square.position }
    end
  end
end
