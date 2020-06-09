# Rock, Paper, Scissors is a two-player game where each player chooses
# one of three possible moves: rock, paper, or scissors. The chosen moves
# will then be compared to see who wins, according to the following rules:

# - rock beats scissors
# - scissors beats paper
# - paper beats rock

# If the players chose the same move, then it's a tie.

# nouns: player, move, rule
# verbs: choose, compare
require 'pry'

class Move
  VALUES = ['rock', 'paper', 'scissors', 'spock', 'lizard']
  @@moves = []

  def initialize
    if @@moves.empty?
      @@moves << [self]
    elsif @@moves.last.size == 2
      @@moves << [self]
    else
      @@moves.last << self
    end
  end

  def self.moves
    @@moves
  end

  def to_s
    self.class.to_s
  end
end

class Rock < Move
  def >(other_move)
    # return true if other move is scissors or lizard
    other_move.class == Scissors || other_move.class == Lizard
  end

  def <(other_move)
    # return true if other move is spock or paper
    other_move.class == Paper || other_move.class == Spock
  end
end

class Paper < Move
  def >(other_move)
    other_move.class == Rock || other_move.class == Spock
  end

  def <(other_move)
    other_move.class == Scissors || other_move.class == Lizard
  end
end

class Scissors < Move
  def >(other_move)
    other_move.class == Paper || other_move.class == Lizard
  end

  def <(other_move)
    other_move.class == Rock || other_move.class == Spock
  end
end

class Spock < Move
  def >(other_move)
    other_move.class == Rock || other_move.class == Scissors
  end

  def <(other_move)
    other_move.class == Lizard || other_move.class == Paper
  end
end

class Lizard < Move
  def >(other_move)
    other_move.class == Spock || other_move.class == Paper
  end

  def <(other_move)
    other_move.class == Rock || other_move.class == Scissors
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    @score = 0
    set_name
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "Whats your name?"
      n = gets.chomp
      break unless n.empty?
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts ""
      puts "Please choose rock, paper, scissors, lizard or spock:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Object.const_get(choice.capitalize).new
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny'].sample
  end

  def choose
    choice = Move::VALUES.sample
    self.move = Object.const_get(choice.capitalize).new
  end
end

# game orchestration engine
class RPSGame
  MATCH_LENGTH = 10
  attr_reader :human, :computer
  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message
    loop do
      player_turns
      calculate_score
      display_game_info
      break if match_winner?
      break unless play_again?
    end
    display_goodbye_message
  end

  private

  def player_turns
    human.choose
    computer.choose
  end

  def display_game_info
    display_moves
    display_winner
    display_score
    display_move_history
  end

  def display_welcome_message
    puts ""
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_goodbye_message
    puts ""
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good Bye!"
  end

  def display_moves
    puts ""
    puts "#{human.name} chose #{human.move.class}."
    puts "#{computer.name} chose #{computer.move.class}."
  end

  def display_move_history
    puts ""
    puts "Move History"
    moves = Move.moves
    moves.each_with_index do |pair, idx|
      puts "#{idx + 1}: #{human.name} #{pair[0]}, #{computer.name} #{pair[1]}"
    end
  end

  def display_score
    puts ""
    puts "The score is:"
    puts "#{human.name}: #{human.score} to #{computer.name}: #{computer.score}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def calculate_score
    human.score += 1 if human.move > computer.move
    computer.score += 1 if computer.move > human.move
  end

  def play_again?
    answer = nil
    loop do
      puts ""
      puts "Would you like to play again?"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry must be y or n."
    end
    answer == 'y' ? true : false
  end

  def match_winner?
    human.score == MATCH_LENGTH || computer.score == MATCH_LENGTH
  end
end

RPSGame.new.play
