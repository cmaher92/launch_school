require 'paint'
require 'pry'

class Square
  attr_accessor :mark

  def initialize(position)
    @position = position
  end

  def available?
    !!@mark
  end

  def to_s
    if @mark == 'X'
      Paint['X', '#00cc66', :bold]
    elsif @mark == 'O'
      Paint['O', '#bf0603', :bold]
    else
      @position.to_s
    end
  end
end

player_marked_square = Square.new(4)
player_marked_square.mark = 'X'

squares = [
Square.new(1),
Square.new(2),
Square.new(3),
player_marked_square
]

puts squares
# squares.each { |square| p format("  %s  ", square) }
