require_relative 'board'
require_relative 'player'
require_relative 'displayable'
require 'pry'

module Tictactoe
  class Game
    include Displayable

    POSITIONS_TO_LOCATIONS = {
      1 => [0,0],
      2 => [0,1],
      3 => [0,2],
      4 => [1,0],
      5 => [1,1],
      6 => [1,2],
      7 => [2,0],
      8 => [2,1],
      9 => [2,2]
    }
    HUMAN_MARKER = 'X'
    COMPUTER_MARKER = 'O'

    def initialize
      @human = Player.new(HUMAN_MARKER)
      @computer = Computer.new(COMPUTER_MARKER)
      @board = Board.new(HUMAN_MARKER, COMPUTER_MARKER)
      @board.current_player_marker = who_goes_first
    end

    def play
      display_welcome
      loop do
        players_take_turns
        break if @board.finished?
      end
      result
    end

    private
    
    def result
      clear
      @board.draw
      if @board.winner_exists?
        display_winner(HUMAN_MARKER) if @board.winner == HUMAN_MARKER
        display_winner(COMPUTER_MARKER) if @board.winner == COMPUTER_MARKER
      else
        display_draw
      end
    end

    def new_game
      new_board = Board.new(HUMAN_MARKER, COMPUTER_MARKER)
      new_board.current_player_marker = @board.starting_player_marker
      @board = new_board
    end

    def who_goes_first
      loop do
        prompt 'Would you like to go first? (y/n)'
        response = gets.chomp.downcase
        break HUMAN_MARKER if ['y', 'yes'].include?(response)
        break COMPUTER_MARKER if ['n', 'no'].include?(response)
        prompt "Invalid response, please enter either 'y' or 'n'"
      end
    end

    def players_take_turns
      if @board.current_player_marker == HUMAN_MARKER
        human_turn
      else
        computer_turn
      end
    end

    def human_turn
      choice = nil
      loop do
        clear
        prompt "Please choose a square: #{@board.positions_unmarked.join(', ')}"
        @board.draw_with_positions
        choice = gets.chomp.to_i
        break if @board.positions_unmarked.include?(choice)
        prompt "Please enter a valid position"
      end
      @board.mark_square(HUMAN_MARKER,POSITIONS_TO_LOCATIONS[choice])
    end

    def computer_turn
      if @board.square_available?(@board.middle_square)
        choice = @board.middle_square
      else
#         choice = @board.locations_unmarked.sample
        choice = @board.best_possible_move
      end
      @board.mark_square(COMPUTER_MARKER,choice)
    end
  end
  

end

game = Tictactoe::Game.new
game.play
