module Displayable
  def display_move_options
    puts ""
    puts "Please select a move"
    puts "Enter move number or move name"
    Move::VALID_MOVE_CHOICES.keys.each_with_index do |move, idx|
      puts "#{idx + 1}. #{move}"
    end
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
    puts "Move History:"
    num = 0
    while num < human.move_history.size
      puts "#{human.name}: #{human.move_history[num]} #{computer.name}: #{computer.move_history[num]}"
      num += 1
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

  def display_match_winner
    puts ""
    if human.score > computer.score
      puts "#{human.name} won the match!"
    else
      puts "#{computer.name} won the match!"
    end
  end
end

class Move
  VALID_MOVE_CHOICES = {
    "Rock" => ['Rock', 'rock', '1'],
    "Paper" => ['Paper', 'paper', '2'],
    "Scissors" => ['Scissors', 'scissors', '3'],
    "Lizard" => ['Lizard', 'lizard', '4'],
    "Spock" => ['Spock', 'spock', '5']
  }

  def to_s
    self.class.to_s
  end
end

class Rock < Move
  def >(other_move)
    # return true if other move is scissors or lizard
    other_move.is_a?(Scissors) || other_move.is_a?(Lizard)
  end

  def <(other_move)
    # return true if other move is spock or paper
    other_move.is_a?(Paper) || other_move.is_a?(Spock)
  end
end

class Paper < Move
  def >(other_move)
    other_move.is_a?(Rock) || other_move.is_a?(Spock)
  end

  def <(other_move)
    other_move.is_a?(Scissors) || other_move.is_a?(Lizard)
  end
end

class Scissors < Move
  def >(other_move)
    other_move.is_a?(Paper) || other_move.is_a?(Lizard)
  end

  def <(other_move)
    other_move.is_a?(Rock) || other_move.is_a?(Spock)
  end
end

class Spock < Move
  def >(other_move)
    other_move.is_a?(Rock) || other_move.is_a?(Scissors)
  end

  def <(other_move)
    other_move.is_a?(Lizard) || other_move.is_a?(Paper)
  end
end

class Lizard < Move
  def >(other_move)
    other_move.is_a?(Spock) || other_move.is_a?(Paper)
  end

  def <(other_move)
    other_move.is_a?(Rock) || other_move.is_a?(Scissors)
  end
end

class Player
  attr_accessor :move, :name, :score, :move_history

  def initialize
    @score = 0
    @move_history = []
    set_name
  end

  def record_move
    self.move_history << move
  end
end

class Human < Player
  include Displayable
  MOVES = [Rock.new, Scissors.new, Paper.new, Lizard.new, Spock.new]

  def set_name
    n = ""
    loop do
      puts "Whats your name?"
      n = gets.chomp
      break unless n.empty? || n.gsub(/ /, "").empty?
      puts "Invalid name, please enter a valid name."
    end
    self.name = n
  end

  def choose
    loop do
      display_move_options
      choice = gets.chomp
      MOVES.each do |move|
        return self.move = move if Move::VALID_MOVE_CHOICES[move.to_s].include?(choice)
      end
      puts "Sorry, invalid choice."
    end
  end
end

class Computer < Player
  attr_accessor :personality

  def set_name
    @name = self.class
  end

  def choose
    possible_moves = []
    @personality.map do |possible_move, freq|
      freq.times { possible_moves << possible_move }
    end
    self.move = possible_moves.sample.new
  end
end

class R2D2 < Computer
  # R2D2 loves rocks and will choose them 60% of the time
  def initialize
    super
    @personality = {
      Rock => 6,
      Scissors => 1,
      Paper => 1,
      Spock => 1,
      Lizard => 1
    }
  end
end

class Alexa < Computer
  def initialize
    super
    @personality = {
      Rock => 1,
      Scissors => 1,
      Paper => 1,
      Spock => 3,
      Lizard => 3
    }
  end
end

# game orchestration engine
class RPSGame
  COMPUTERS = [R2D2.new, Alexa.new]
  include Displayable
  attr_reader :human, :computer

  def initialize
    @human = Human.new
    @computer = COMPUTERS.sample
    @points_to_win = 10
  end

  def play
    display_welcome_message
    start_match
    display_goodbye_message
  end

  private

  def start_match
    loop do
      match_points
      start_game
      display_match_winner
      break unless play_again?
      reset_score
    end
  end

  def start_game
    loop do
      player_turns
      calculate_score
      display_game_info
      break if match_winner?
    end
  end

  def reset_score
    human.score = 0
    computer.score = 0
  end

  def match_points
    points = nil
    loop do
      puts ""
      puts "How many points do you want the match to be for?"
      points = gets.chomp
      break if points.to_i.to_s == points
    end
    @points_to_win = points.to_i
  end

  def player_turns
    human.choose
    human.record_move
    computer.choose
    computer.record_move
  end

  def calculate_score
    human.score += 1 if human.move > computer.move
    computer.score += 1 if computer.move > human.move
  end

  def play_again?
    answer = nil
    loop do
      puts ""
      puts "Would you like to play another match?"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry must be y or n."
    end
    ['y', 'yes'].include?(answer) ? true : false
  end

  def match_winner?
    human.score == @points_to_win || computer.score == @points_to_win
  end
end

RPSGame.new.play
