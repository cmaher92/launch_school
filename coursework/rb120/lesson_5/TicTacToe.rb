class Board
  def initialize
    # we need some way to model the 3x3 grid. Maybe "squares"?
    # what data structure should we use?
    # - array/hash of Square objects?
    # - array/hash of strings or integers?
    @grid = make_grid(3, 3)
  end
  
  def display
  end
  
  private
  def make_grid(row, column)
    Array.new(row) { Array.new(column) { Square.new } }
  end
end

class Square
  attr_accessor :mark
  
  def initialize
  end
  
  def to_s
    mark
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