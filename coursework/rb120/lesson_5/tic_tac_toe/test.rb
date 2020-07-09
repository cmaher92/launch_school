require 'pry'
require_relative 'board'

test_board = Tictactoe::Board.new
test_board.mark_square('X', [0, 0])
test_board.draw