# rock paper scissors

# keep score of the player's and computers wins
#   make the game a loop
#   track wins in an array, play the game until either item gets to 5
#   increment when either wins
#   - when either the player or computer reaches five wins, the match is over

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

def update_scoreboard(scoreboard, winner, choice, cp_choice)
  scoreboard[0] += 1 if winner == choice
  scoreboard[1] += 1 if winner == cp_choice
  scoreboard
end

def play_game(scoreboard)
  choice = get_choice
  cp_choice = CHOICES.keys.sample
  winner = check_winner(choice, cp_choice)
  display_results(choice, cp_choice, winner)
  update_scoreboard(scoreboard, winner, choice, cp_choice)
end

def display_match_winner(scoreboard)
  scoreboard[0] == 5 ? prompt("You won the match!") : prompt("The computer won the match")
end

def play_match?
  prompt("Would you like to play a match? Best of 5 wins. (y/n)")
  response = gets.chomp
  return true if /[yY]/.match?(response)
end

scoreboard = [0, 0]
match = nil
loop do
  match = play_match? if match == nil
  play_game(scoreboard)
  display_match_winner(scoreboard) if scoreboard.include?(5)
  prompt("You have #{scoreboard[0]} wins and the computer has #{scoreboard[1]} wins.") if match && scoreboard.include?(5) == false
  break if scoreboard.include?(5)
  break if !match
end
