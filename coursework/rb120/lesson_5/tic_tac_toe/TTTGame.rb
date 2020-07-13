require_relative 'tic_tac_toe/board'
require_relative 'tic_tac_toe/game'

class TTTGame
  def initialize
    @games_played = []
    @current_game = Tictactoe::Game.new
  end

  def play
    loop do
      play_game
      play_again? ? new_game : break
    end
  end

  private

  def play_game
    if @games_played.empty?
      @current_game.play
    else
      @current_game.play_without_intro
    end
  end

  def play_again?
    puts "Would you like to play another game? (y/n)"
    loop do
      answer = gets.chomp
      break true if ['y', 'yes'].include?(answer)
      break false if ['n', 'no'].include?(answer)
      puts "Invalid response, please try again"
    end
  end

  def new_game
    @games_played << @current_game
    new_game = Tictactoe::Game.new
    new_game.first_player = @current_game.first_player
    @current_game = new_game
  end
end

TTTGame.new.play
