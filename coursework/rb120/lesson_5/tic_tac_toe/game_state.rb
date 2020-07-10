module Tictactoe
  class GameState
    attr_reader :player_piece, :opponent_piece, :winner, :board
    
    def initialize(board, player_piece, opponent_piece)
      @board = board
      @player_piece = player_piece
      @opponent_piece = opponent_piece
      @max_index = 2
      @minimum_moves_required_to_win = 5
      @board_width = @board.first.length
      check_for_win
    end
    
    def available_moves
      @board.locations_unmarked
    end
    
    def unplayed?
      @board.empty?
    end
    
    def final_move
      return @board.unmarked_spaces.first if @board.number_of_unmarked == 1
    end
    
    private
    
    def check_for_win
      # if number_of_occupied squares is greater than minimum_moves_required_to_win then
      # check each line in row, column, diag, reverse diag
      #   if a line is a winner, assign to @winner instance variable
    end
    
  end
end