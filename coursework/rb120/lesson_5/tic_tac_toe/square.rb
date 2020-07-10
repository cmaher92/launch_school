require 'paint'

module Tictactoe
  class Square
    attr_accessor :marker
    attr_reader :position
    def initialize(position)
      @position = position
    end

    def to_s
      if marker == 'X'
        Paint['X', '#00cc66', :bold]
      elsif marker == 'O'
        Paint['O', '#bf0603', :bold]
      else
        " "
      end
    end
    
    def marked?
      !marker.nil?
    end
  end
end