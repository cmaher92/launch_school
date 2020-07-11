require_relative 'drawable'
require_relative 'square'

module Tictactoe
  class Board
    include Drawable
    attr_accessor :number_of_marked, :number_of_unmarked, :locations_unmarked,
                  :current_player_marker, :starting_player_marker,
                  :middle_square, :winner, :board

    LOCATIONS_UNMARKED = [
      [0, 0], [0, 1], [0, 2],
      [1, 0], [1, 1], [1, 2],
      [2, 0], [2, 1], [2, 2]
    ]
    NUMBER_OF_SQUARES = 9

    def initialize(human_marker, computer_marker)
      @human_marker = human_marker
      @computer_marker = computer_marker
      @number_of_squares = NUMBER_OF_SQUARES
      @number_of_marked = 0
      @number_of_unmarked = 9
      @locations_unmarked = LOCATIONS_UNMARKED
      @board = build_board
      @middle_square = [1,1]
    end

    def winner_exists?
      !!@winner
    end

    def active_board?
      @active_board
    end

    def find_best_choice
      minimax
      @active_board = true
      @choice
    end

    def minimax
      return score if finished?
      scores = []
      moves = []

      @locations_unmarked.each do |move|
          possible_board = get_new_state(move)
          scores.push possible_board.minimax
          moves.push move
      end
      # binding.pry

      if active_board?
        binding.pry
        max_score_index = scores.each_with_index.max[1]
        @choice = moves[max_score_index]
        return scores[max_score_index]
      end
    end

   def get_new_state(move)
    board = Board.new(@human_marker, @computer_marker)
    board.locations_unmarked = @locations_unmarked
    board.number_of_marked = @number_of_marked
    board.number_of_unmarked = @number_of_unmarked
    board.board = @board.map { |row| row.map(&:dup) }
    board.mark_square(@current_player_marker, move)
   end

    def score
      if @winner == @computer_marker
        1
      elsif @winner == @human_marker
        -1
      else
        0
      end
    end

    def check_for_winner
      # if there is a winner, set @winner
      # check rows
      return if number_of_marked < 5
      @winner = check_rows || check_columns || check_diagonal || check_reverse_diagonal
    end

    def positions_unmarked
      @board.flatten.select { |square| square.unmarked? }.map { |square| square.position }
    end

    def to_a
      @board.flatten
    end

    def finished?
      @winner || draw?
    end

    def draw?
      number_of_unmarked == 0 && !@winner
    end

    def current_player_marker=(marker)
      @current_player_marker = marker
      @starting_player_marker = marker if @starting_player_marker.nil?
    end

    def mark_square(marker, location)
      @board[location.first][location.last].marker = marker
      @number_of_unmarked -= 1
      @number_of_marked += 1
      @locations_unmarked.delete(location)
      check_for_winner
      swap_turns
      self
    end

    def empty?
      number_of_squares == number_of_unmarked
    end

    def contents_of(location)
      @board[location.first][location.last].marker
    end

    def square_available?(location)
      @board[location.first][location.last].unmarked?
    end

    private

    def check_rows
      @board.size.times do |row_index|
        candidate = check_line([row_index, 0]) { |index| [row_index, index] }
        return candidate if candidate
      end
      nil
    end

    def check_columns
      @board.size.times do |col_index|
        candidate = check_line([0, col_index]) { |index| [index, col_index]}
        return candidate if candidate
      end
      nil
    end

    def check_diagonal
      check_line([0,0]) { |index| [index, index] }
    end

    def check_reverse_diagonal
      max_index = @board.size - 1
      check_line([0,max_index]) { |index| [index, max_index - index] }
    end

    def check_line(starting_location)
      # retrieve marker from given location, set as candidate
      candidate = contents_of(starting_location)
      return if candidate.nil?

      # retrieve remaining squares from this line and check if they're the same as first
      (1..@board.size - 1).each do |index|
        square_location = yield index
        square_marker = contents_of(square_location)
        return if square_marker != candidate # if this square doesn't have same marker, its not a winning line
      end

      # if all three markers in line were the same, return marker
      candidate
    end

    def build_board
      squares = (1..NUMBER_OF_SQUARES).map { |pos| Square.new(pos) }
      @board = Array.new(3) { Array.new(3) { squares.shift } }
    end

    def swap_turns
      if @current_player_marker == @human_marker
        @current_player_marker = @computer_marker
      else
        @current_player_marker = @human_marker
      end
    end

  end
end
