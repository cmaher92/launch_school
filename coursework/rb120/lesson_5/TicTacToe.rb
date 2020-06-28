module Displayable
  def display_board
    #
  end
end

class Board
  def initialize
    # we need some way to model the 3x3 grid. Maybe "squares"?
    # what data structure should we use?
    # - array/hash of Square objects?
    # - array/hash of strings or integers?
    @grid = make_grid(3, 3)
  end
  
  private
  def make_grid(row, column)
    Array.new(row * column)
  end
end

class Square
  def initialize
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

game = TTTGame.new
game.play