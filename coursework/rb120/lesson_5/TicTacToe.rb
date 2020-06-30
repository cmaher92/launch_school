module Displayable
  EMPTY_LINE = "     |     |     "
  MID_LINE = "_____|_____|_____"

  def display_board
    puts display_row(0),
         display_row(1),
         display_row(2)
  end

  private

  def display_row(row_index)
    row = @grid[row_index]
    puts
      EMPTY_LINE,
      "  #{row[0]}  |  #{row[1]}  |  #{row[2]}  ",
      (row_index == 2 ? EMPTY_LINE : MID_LINE)
  end
end

class Board
  include Displayable

  attr_reader :grid # not needed outside of testing

  def initialize
    @grid = make_grid(3, 3)
  end

  private

  def make_grid(row, column)
    Array.new(row) { Array.new(column) { Square.new } }
  end
end

class Square
  def initialize
    @mark = " "
  end

  def to_s
    @mark
  end
end

class Player
  def initialize
    # maybe a "marker" to keep track of this player's symbol (ie, 'X' or 'O')
  end

  def mark

  end
end

class TTTGame

  def play
    display_welcome_message
    loop do
      display_board
      first_player_moves
      break if someone_won? || board_full?

      second_player_moves
      break if someone_won? || board_full?
    end
    display_result
    display_goodbye_message
  end

end

puts Board.new.display_board
