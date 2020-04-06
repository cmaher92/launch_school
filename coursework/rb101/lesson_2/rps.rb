# rock paper scissors

# update the program so the user can type just the first letter for their choice
# keep score of the player's and computers wins
#   - when either the player or computer reaches five wins, the match is over

# validate_choice method
# iterate through the choices keys
# if the choice is equal to the key, or equal to first letter of the choice return true
# else return false

require 'pry'

CHOICES = { 
  'rock' => ['scissors', 'lizard'], 
  'paper' => ['rock', 'spock'], 
  'scissors' => ['paper', 'lizard'], 
  'lizard' => ['spock', 'paper'],
  'spock' => ['scissors', 'rock']
}

def prompt(message)
  puts("#=> #{message}")
end

def check_winner(choice, cp_choice)
  # returns winning choice, or nil if tie
  return choice if CHOICES[choice].include?(cp_choice)
  return cp_choice if CHOICES[cp_choice].include?(choice)
  nil
end

def valid_choice?(choice)
  CHOICES.keys.each do |key|
    return true if key == choice || key[0] == choice
  end
  false
end

def normalize_choice(choice)
  # returns the entire string if the user just used a one-letter reference to a choice
  CHOICES.keys.each { |key| return key if key[0] == choice }
end

def get_choice
  choice = nil

  loop do
  prompt("Choose one: #{CHOICES.keys.join(', ')}")
  choice = gets.chomp

  valid_choice?(choice) ? break : prompt("#{choice} is not a valid choice.")
  end

  choice = normalize_choice(choice) if choice.length == 1
  choice
end

def display_results(choice, cp_choice, winner)
  # displays the winner
  prompt("You chose #{choice}, the computer chose #{cp_choice}...")
  prompt("It's a tie!") if winner == nil
  prompt("You Won!") if winner == choice
  prompt('The Computer won.') if winner == cp_choice
end

choice = get_choice
cp_choice = CHOICES.keys.sample
winner = check_winner(choice, cp_choice)
display_results(choice, cp_choice, winner)
