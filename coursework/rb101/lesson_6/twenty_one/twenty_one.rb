# twenty_one.rb

require 'pry'
require 'pry-byebug'

def prompt(msg)
  puts ">> #{msg}"
end

def init_deck
  cards = []
  suits = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
  face_and_values = [
    ['2', 2], ['3', 3], ['4', 4], ['5', 5], ['6', 6],
    ['7', 7], ['8', 8], ['9', 9,], ['10', 10], ['Jack', 10],
    ['Queen', 10], ['King', 10], ['Ace', 1]
  ]

  suits.each do |suit|
    face_and_values.each { |face, value| cards << [face, suit, value] }
  end

  deck = cards.map do |face, suit, value|
    {
      face: face,
      suit: suit,
      value: value
    }
  end

  deck
end

def deal_hands!(deck)
  hands = []
  2.times do
    hand = []
    2.times { hand << deck.slice!(rand(0...deck.size)) }
    hands << hand
  end
  hands
end

def display_players_hand(hand, hand_value)
  cards = hand.reduce([]) { |cards, card| cards << card[:face] }
  prompt "Player has #{cards.join(', ')}, for a total of #{hand_value}"
end

def display_dealers_hand(hand, hand_value, hidden=true)
  if hidden
    card = hand[0]
    prompt "Dealer is showing a #{card[:face]}"
  else
    cards = hand.reduce([]) { |cards, card| cards << card[:face] }
    prompt "Dealer has #{cards.join(', ')}"
    prompt "For a total of #{hand_value}"
  end
end

def calculate_hand_value(hand)
  values = []
  hand.each { |card| values << card[:value] }
  total = values.reduce(:+)
  return (total + 10) if values.include?(1) && (total + 10 < 22)
  total
end

def hit!(deck, hand)
  hand << deck.slice!(rand(0...deck.size))
end

def hit_or_stay
  response = nil
  loop do
    prompt "Would you like to hit or stay? (hit/stay)"
    response = gets.chomp
    break if response == 'hit' || response == 'stay'
    prompt "Please enter a valid response"
  end
  response
end

def play_again?
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def display_results(players_hand, dealers_hand, players_hand_value, dealers_hand_value)
  players_hand = players_hand.map { |card| card[:face] }.join(', ')
  dealers_hand = dealers_hand.map { |card| card[:face] }.join(', ')
  puts "=============="
  prompt "Dealer has (#{dealers_hand}) for a total of: #{dealers_hand_value}"
  prompt "Player has (#{players_hand}) for a total of: #{players_hand_value}"
  puts "=============="
end

system 'clear'
puts ""
prompt "Welcome to Twenty One!"
prompt "----------------------"
puts ""

# game loop
loop do
  deck = init_deck
  players_hand, dealers_hand = deal_hands!(deck)
  # cache totals
  players_hand_value = calculate_hand_value(players_hand)
  dealers_hand_value = calculate_hand_value(dealers_hand)

  display_dealers_hand(dealers_hand, dealers_hand_value)
  puts ""

  # possible blackjack
  if players_hand_value && dealers_hand_value == 21
    prompt "Push."
    prompt "Both dealer and player have blackjack."
    display_results(players_hand, dealers_hand, players_hand_value, dealers_hand_value)
    play_again? ? next : break
  elsif players_hand_value == 21
    prompt "Winner winner chicken dinner! Blackjack!"
    display_results(players_hand, dealers_hand, players_hand_value, dealers_hand_value)
    play_again? ? next : break
  elsif dealers_hand_value == 21
    prompt "Sorry, dealer has blackjack. Player loses."
    display_results(players_hand, dealers_hand, players_hand_value, dealers_hand_value)
    play_again? ? next : break
  end

  # players_turn
  loop do
    display_players_hand(players_hand, players_hand_value)
    puts ""
    players_choice = hit_or_stay

    if players_choice == 'hit'
      puts ""
      prompt('Player hits.')
      sleep(1)
      hit!(deck, players_hand)
      players_hand_value = calculate_hand_value(players_hand)
      if players_hand_value > 21
        prompt "Player busts."
        break
      end
    else
      prompt "Player stays."
      puts ''
      break
    end
  end
  if players_hand_value > 21
    display_results(players_hand, dealers_hand, players_hand_value, dealers_hand_value)
    play_again? ? next : break
  end

  # dealers_turn
  loop do
    display_dealers_hand(dealers_hand, dealers_hand_value, false)
    sleep(1)
    if dealers_hand_value >= 17
      puts ''
      prompt 'Dealer stays.'
      break
    end
    hit!(deck, dealers_hand)
    dealers_hand_value = calculate_hand_value(dealers_hand)
    puts ''
    prompt 'Dealer hits.'
    puts ''
    sleep(1)
    if dealers_hand_value > 21
      display_dealers_hand(dealers_hand, dealers_hand_value, false)
      prompt 'Dealer busts.'
      puts ''
      break
    end
  end
  if dealers_hand_value > 21
    display_results(players_hand, dealers_hand, players_hand_value, dealers_hand_value)
    play_again? ? next : break
  end

  # compare hands
  if players_hand_value == dealers_hand_value
    prompt('Push.')
  elsif players_hand_value > dealers_hand_value
    prompt('Player wins.')
  else
    puts ''
    prompt('Dealer wins.')
  end

  display_results(players_hand, dealers_hand, players_hand_value, dealers_hand_value)
  break unless play_again?
end

puts ''
prompt 'Thanks for playing!'
