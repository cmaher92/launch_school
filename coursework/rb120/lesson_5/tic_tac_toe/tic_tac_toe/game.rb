require_relative 'board'
require_relative 'player'
require_relative 'displayable'

module Tictactoe
  class Game
    include Displayable
    attr_reader :board, :first_player

    POSITIONS_TO_LOCATIONS = {
      1 => [0, 0],
      2 => [0, 1],
      3 => [0, 2],
      4 => [1, 0],
      5 => [1, 1],
      6 => [1, 2],
      7 => [2, 0],
      8 => [2, 1],
      9 => [2, 2]
    }

    HUMAN_MARKER = 'X'
    COMPUTER_MARKER = 'O'

    def initialize
      @human = Player.new(HUMAN_MARKER)
      @computer = Computer.new(COMPUTER_MARKER)
      @board = Board.new(HUMAN_MARKER, COMPUTER_MARKER)
    end

    def play
      display_welcome
      ask_who_goes_first
      loop do
        players_take_turns
        break if @board.finished?
      end
      result
    end

    def play_without_intro
      loop do
        players_take_turns
        break if @board.finished?
      end
      result
    end

    def first_player=(marker)
      @first_player = marker
      @board.current_player_marker = marker
    end

    private

    def result
      clear
      @board.draw
      if @board.winner_exists?
        set_winner
        display_winner(HUMAN_MARKER) if @board.winner == HUMAN_MARKER
        display_winner(COMPUTER_MARKER) if @board.winner == COMPUTER_MARKER
      else
        display_draw
      end
    end

    def set_winner
      @winner = HUMAN_MARKER if @board.winner == HUMAN_MARKER
      @winner = COMPUTER_MARKER if @board.winner == COMPUTER_MARKER
    end

    def ask_who_goes_first
      prompt 'Would you like to go first? (y/n)'
      response = nil
      loop do
        response = gets.chomp.downcase
        break if ['y', 'n', 'no', 'yes'].include?(response)
        prompt "Invalid response, please enter either 'y' or 'n'"
      end
      self.first_player = HUMAN_MARKER if ['y', 'yes'].include?(response)
      self.first_player = COMPUTER_MARKER if ['n', 'no'].include?(response)
    end

    def players_take_turns
      if @board.current_player_marker == HUMAN_MARKER
        human_turn
      else
        computer_turn
      end
    end

    def human_turn
      clear
      @board.draw_with_positions
      choice = ask_human_for_choice
      @board.mark_square(POSITIONS_TO_LOCATIONS[choice])
    end

    def computer_turn
      clear
      @board.draw
      puts Tictactoe::Displayable::BLANK_SPACE
      puts "The computer is finding the best possible move..."
      square_location = @board.find_best_move
      @board.mark_square(square_location)
    end

    def ask_human_for_choice
      choice = nil
      options = joiner(@board.positions_unmarked, 'or')
      prompt "Please choose a square: #{options}"
      loop do
        choice = gets.chomp.to_i
        break if @board.positions_unmarked.include?(choice)
        prompt "Please enter a valid position"
      end
      choice
    end

    def joiner(array, delimiter)
      case array.size
      when 1 then array.first.to_s
      when 2 then array.insert(1, delimiter).join(' ')
      else
        "#{array[0...-1].join(', ')}, #{delimiter} #{array[-1]}"
      end
    end
  end
end
