# number guesser

# create a number guessing class for numbers in the range of 1..100, with
# a limit of 7 guesses per game

class InvalidGuessError < StandardError; end

class GuessingGame
  LOW = "Your guess is too low."
  HIGH = "Your guess is too high."
  NO_MORE_GUESSES = "You have no more guesses. You lost!"
  CORRECT = "That's the number!"

  def initialize(low, high)
    @low = low
    @high = high
    @answer = rand(low..high)
    @guesses = Math.log2((@low..@high).size).to_i + 1
    @guess = nil
  end

  def play
    play_game
    display_result
  end

  private

  def play_game
    loop do
      puts ''
      puts "You have #{@guesses} remaining"
      puts "Enter a number between #{@low} and #{@high}:"
      @guess = gets.chomp
      @guesses -= 1
      break if @guesses == 0 || (valid_guess? && correct_guess?)
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
    return true if @guess.to_i.between?(@low, @high)
    raise InvalidGuessError, "Invalid Guess: Out of bounds"
  end

  def int?
    return true if @guess.to_i.to_s == @guess
    raise InvalidGuessError, "Invalid Guess: Not a number"
  end
end

GuessingGame.new(501, 1500).play
