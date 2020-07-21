# number guesser

# create a number guessing class for numbers in the range of 1..100, with
# a limit of 7 guesses per game

class InvalidGuessError < StandardError; end

class GuessingGame
  LOWER_BOUND = 1
  UPPER_BOUND = 100
  GUESSES = 7
  PROMPT = "Enter a number between #{LOWER_BOUND} and #{UPPER_BOUND}:"
  LOW = "Your guess is too low."
  HIGH = "Your guess is too high."
  NO_MORE_GUESSES = "You have no more guesses. You lost!"

  def initialize
    @guesses = 7
    @answer = rand(1..100)
    @guess = nil
  end

  def play
    play_game
    display_result
  end


  private

  def play_game
    loop do
      break if @guesses == 0
      puts ''
      puts "You have #{@guesses} remaining"
      puts PROMPT
      @guess = gets.chomp
      @guesses -= 1
      break if (valid_guess? && correct_guess?)
    end
  end

  def display_result
    puts ""
    puts NO_MORE_GUESSES if @guesses == 0
    puts CORRECT if @guess.to_i == @answer
  end

  def check_guess
    raise InvalidGuessError, HIGH if @guess.to_i > @answer
    raise InvalidGuessError, LOW if @guess.to_i < @answer
  end

  def correct_guess?
    begin
      return true if @guess.to_i == @answer
      check_guess
    rescue InvalidGuessError => e
      puts e
      false
    end
  end

  def valid_guess?
    begin
      return true if int? && in_bounds?
    rescue InvalidGuessError => e
      puts e
      false
    end
  end

  def in_bounds?
    return true if @guess.to_i.between?(LOWER_BOUND, UPPER_BOUND)
    raise InvalidGuessError, "Invalid Guess: Out of bounds"
  end

  def int?
    return true if @guess.to_i.to_s == @guess
    raise InvalidGuessError, "Invalid Guess: Not a number"
  end
end

GuessingGame.new.play
