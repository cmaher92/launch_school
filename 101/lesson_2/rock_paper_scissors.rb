
VALID_CHOICES = %w(rock paper scissors lizard spock).freeze

def test_method
  prompt('test method')
end

def prompt(message)
  puts("=> #{message}")
  # interpolated
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  # Note the usage of 'display' clearly describing that this method will print
  if win?(player, computer)
    prompt('You won!')
  elsif win?(computer, player)
    prompt('Computer won!')
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp
    # case sensitive, need to handle that
    break if VALID_CHOICES.include?(choice)
    prompt('Invalid choice, please try again.')
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice} and the computer chose #{computer_choice}")

  display_results(choice, computer_choice)

  prompt('Do you want to play again? (y/n)')
  play_again = gets.chomp.downcase
  break if play_again == 'n' || play_again == 'no'
end
