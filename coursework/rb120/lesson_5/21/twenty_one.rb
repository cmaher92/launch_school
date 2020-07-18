require_relative 'dealer'
require_relative 'player'
require_relative 'deck'
require_relative 'hand'
require 'pry'

module Twenty_one
  class Game
    def initialize
      @dealer = Dealer.new
      @player = Player.new
      @deck = Deck.new
    end

    def start
      loop do
        play_hand
        display_result
        play_again? ? reset : break
      end
      puts 'Thank you for playing!'
    end

    private
    
    def play_hand
      loop do
        deal_starting_hand
        break if @player.blackjack? || @dealer.blackjack?
        player_turn
        break if @player.bust?
        dealer_turn
        break
      end
    end
    
    def display_result
      @dealer.reveal_hand
      display_hands
      case
      when @player.blackjack?
        puts "Winner winner chicken dinner! Player has TWENTY-ONE"
      when @dealer.blackjack?
        puts "Dealer has Twenty-one, dealer wins."
      when @player.bust?
        puts "Player busts, dealer wins."
      when @dealer.bust?
        puts "Dealer busts, player wins."
      when @dealer.hand == @player.hand
        puts "Push."
      when @player.hand > @dealer.hand
        puts "Player wins."
      when @dealer.hand > @player.hand
        puts "Dealer wins."
      end
    end

    def reset
      @player.new_hand
      @dealer.new_hand
    end

    def play_again?
      answer = nil
      puts "--"
      puts "Would you like to play again? (y/n)"
      loop do
        answer = gets.chomp.downcase
        break if ['y', 'n', 'yes', 'no'].include?(answer)
        puts "Invalid response, please try again."
      end
      ['y', 'yes'].include?(answer) ? true : false
    end

    def deal_starting_hand
      @player.hand << @deck.deal
      @dealer.hand << @deck.deal.hide
      @player.hand << @deck.deal
      @dealer.hand << @deck.deal
      display_hands
    end

    def display_hands
      system 'clear'
      puts "TWENTY-ONE"
      puts "by Connor Maher"
      puts ""
      @player.display_hand
      @dealer.display_hand
    end

    def player_turn
      loop do
        if @player.hit?
          @player.hand << @deck.deal
          display_hands
          break if @player.bust?
        else
          break
        end
      end
    end

    def dealer_turn
      @dealer.reveal_hand
      loop do
        if @dealer.hit?
          @dealer.hand << @deck.deal
          display_hands
          break if @dealer.bust?
        else
          break
        end
      end
    end
  end
end

Twenty_one::Game.new.start
