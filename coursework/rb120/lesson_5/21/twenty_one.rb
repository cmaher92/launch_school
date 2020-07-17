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
        deal_starting_hand
        player_turn
        dealer_turn if !@player.bust?
        if !@dealer.bust? && !@player.bust?
          break if draw?
          display_winner
        end
        play_again? ? reset : break
      end
      puts 'Thank you for playing!'
    end

    private

    def reset
      @player.new_hand
      @dealer.new_hand
    end

    def play_again?
      answer = nil
      puts "Would you like to play again? (y/n)"
      loop do
        answer = gets.chomp.downcase
        break if ['y', 'n', 'yes', 'no'].include?(answer)
        puts "Invalid response, please try again."
      end
      ['y', 'yes'].include?(answer) ? true : false
    end

    def display_winner
      system 'clear'
      display_hands
      if @player.hand > @dealer.hand
        puts "Player wins!"
      else
        puts "Dealer wins"
      end
    end

    def draw?
      if @player.hand == @dealer.hand
        puts "Draw"
        display_hands
        return true
      end
      false
    end

    def deal_starting_hand
      system 'clear'
      puts "Blackjack - Written by Connor Maher"
      @player.hand << @deck.deal
      @dealer.hand << @deck.deal.hide
      @player.hand << @deck.deal
      @dealer.hand << @deck.deal
      display_hands
    end

    def display_hands
      @dealer.display_hand
      @player.display_hand
    end

    def player_turn
      system 'clear'
      display_hands
      loop do
        if @player.hit?
          system 'clear'
          @player.hand << @deck.deal
          @dealer.display_hand
          @player.display_hit
          player_busts if @player.bust?
          break if @player.bust?
        else
          puts "Player stays"
          break
        end
      end
    end

    def dealer_turn
      system 'clear'
      puts "Dealers turn"
      @dealer.reveal_hand
      loop do
        if @dealer.hit?
          puts "Dealer hits"
          @dealer.hand << @deck.deal
          @dealer.display_hand
          dealer_busts if @dealer.bust?
          break if @dealer.bust?
        else
          puts "Dealer stays"
          break
        end
      end
    end

    def player_busts
      system 'clear'
      puts "Player busts, dealer wins."
      @dealer.reveal_hand
      display_hands
    end

    def dealer_busts
      system 'clear'
      puts "Dealer busts, player wins."
      display_hands
    end
  end
end

Twenty_one::Game.new.start
