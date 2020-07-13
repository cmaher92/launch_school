module Tictactoe
  class Player
    attr_reader :marker

    def initialize(marker)
      @marker = marker
    end
  end

  class Computer < Player
  end
end
