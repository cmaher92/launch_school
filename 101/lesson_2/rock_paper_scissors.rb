
VALID_CHOICES = %w(rock paper scissors lizard spock).freeze

WHO_BEATS_WHO = {
  rock: ['scissors', 'lizard'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  lizard: ['paper', 'spock'],
  spock: ['scissors', 'rock']
}.freeze

PLAYER_WIN_TOTAL = 0
COMPUTER_WIN_TOTAL = 0

def prompt(message)
  puts("=> #{message}")
  # interpolated
end

def win?(first, second)
  WHO_BEATS_WHO[first.to_sym].include?(second)
end

def add_player_win
  PLAYER_WIN_TOTAL += 1
  declare_winner('player') if player_win_total == 5
end

def add_computer_win
  COMPUTER_WIN_TOTAL += 1
  declare_winner('computer') if computer_win_total == 5
end

def declare_winner(winner)
  display_winner(winner)
  reset_scores
end

def display_winner(winner)
  prompt("#{winner} is the first one to 5 wins! #{winner} wins")
end

def display_scores
  prompt("You have #{player_win_total} wins and the computer has 
         #{computer_win_total} wins")
end

def reset_scores
  player_win_total = 0
  computer_win_total = 0
end

def display_results(player, computer)
  # Note the usage of 'display' clearly describing that this method will print
  if win?(player, computer)
    prompt('You won!')
    add_player_win
  elsif win?(computer, player)
    prompt('Computer won!')
    add_computer_win
  else
    prompt("It's a tie!")
  end
end

def map_choice(choice)
  case choice
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 's'
    scissors_or_spock
  when 'l'
    'lizard'
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

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp
    choice = map_choice(choice)

    break if VALID_CHOICES.include?(choice)
    prompt('Invalid choice, please try again.')
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice} and the computer chose #{computer_choice}")

  display_results(choice, computer_choice)

  display_scores
  prompt('Do you want to play again? (y/n)')
  play_again = gets.chomp.downcase
  break if play_again == 'n' || play_again == 'no'
end
