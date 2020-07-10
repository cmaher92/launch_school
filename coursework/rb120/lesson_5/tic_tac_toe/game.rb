require_relative 'board'
require_relative 'player'

module Tictactoe
  class Game
    HUMAN_MARKER = 'X'
    COMPUTER_MARKER = 'O'

    def initialize
      human = Player.new(HUMAN_MARKER)
      computer = Computer.new(COMPUTER_MARKER)
    end

    def play
    end
  end
end
