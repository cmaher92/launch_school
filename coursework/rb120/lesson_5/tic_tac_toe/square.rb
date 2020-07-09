require 'paint'

module Tictactoe
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