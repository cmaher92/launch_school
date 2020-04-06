# rock paper scissors

VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts("#=> #{message}")
end

def display_results(choice, cp_choice)
  prompt("You chose #{choice}, the computer chose #{cp_choice}.")
  if (choice == 'rock' && cp_choice == 'scissors') || 
    (choice == 'paper' && cp_choice == 'rock') ||
    (choice == 'scissors' && cp_choice == 'paper')
   prompt("You won!")
  elsif (choice == 'rock' && cp_choice == 'paper') ||
    (choice == 'paper' && cp_choice == 'scissors') ||
    (choice == 'scissors' && cp_choice == 'rock')
    prompt("You lose!")
  else
    prompt("It's a tie!")
  end
end

choice = nil
loop do
  prompt("Choose one: #{VALID_CHOICES.join(', ')}")
  choice = gets.chomp

  VALID_CHOICES.include?(choice) ? break : prompt("#{choice} is not a valid choice.")
end

cp_choice = VALID_CHOICES.sample
display_results(choice, cp_choice)