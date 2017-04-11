require 'pry'

VALID_CHOICES = %w(rock paper scissors lizard spock).freeze

WHO_BEATS_WHO = {
  rock: ['scissors', 'lizard'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  lizard: ['paper', 'spock'],
  spock: ['scissors', 'rock']
}.freeze

player_win_total = 0
computer_win_total = 0
round_winner = ''
choice = ''

def prompt(message)
  puts("=> #{message}")
  # interpolated
end

def win?(first, second)
  WHO_BEATS_WHO[first.to_sym].include?(second)
end

def display_scores(player, computer)
  prompt("You have #{player} wins and the computer has #{computer} wins")
end


def calculate_winner(player, computer)
  if win?(player, computer)
    'player'
  elsif win?(computer, player)
   'computer'
  else
    'tie'
  end
end

def parse_choice(choice)
  case choice
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 's'
    scissors_or_spock
  when 'l'
    'lizard'
  else
    choice
  end
end

def scissors_or_spock
  prompt('Did you mean scissors? (y/n)')
  response = gets.chomp.downcase
  if response == 'y' || response == 'yes'
    'scissors'
  else
    'spock'
  end
end

def check_winner?(win_count)
  win_count <= 5
end

# Game flow begins here
loop do
  # player_win_total = 0
  # computer_win_total = 0
  # round_winner = ''
  # choice = ''

  # Ask player to choose an option
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp
    choice = parse_choice(choice)
    break if VALID_CHOICES.include?(choice)
    prompt('Invalid choice, please try again.')
  end

  # Computers' choice is randomly sampled
  computer_choice = VALID_CHOICES.sample

  # Choices are announced
  prompt("You chose #{choice} and the computer chose #{computer_choice}")
  round_winner = calculate_winner(choice, computer_choice)

  # Scores are added if necessary
  if round_winner == 'player'
    prompt('You won')
    player_win_total += 1
  elsif round_winner == 'computer'
    prompt('The computer won')
    computer_win_total += 1
  else
    prompt("It's a tie!")
  end

  # Display scores
  display_scores(player_win_total, computer_win_total)

  # Checks to see if either the player or the computer have five wins
  check_winner?(player_win_total)
  check_winner?(computer_win_total)

  # Ask the user if they want to either play a new match or new round
  # based on if the match is over or not
  # prompt('Do you want to play again? (y/n)')
  # play_again = gets.chomp.downcase
  # break if play_again == 'n' || play_again == 'no'
end
