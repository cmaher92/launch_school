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
        if @player.bust?
          player_busts
          break
        end
        dealer_turn
        if @dealer.bust?
          dealer_busts
          break
        end
        if @player.hand == @dealer.hand
          puts "Draw"
          display_hands
          break
        end
        if @player.hand > @dealer.hand
          system 'clear'
          display_hands
          puts "Player wins!"
          break
        else
          system 'clear'
          display_hands
          puts "Dealer wins"
          break
        end
      end
    end

    private

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
      loop do
        if @player.hit?
          puts "Player hits"
          @player.hand << @deck.deal
          @player.display_hand
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
      loop do
        @dealer.reveal_hand
        if @dealer.hit?
          puts "Dealer hits"
          @dealer.hand << @deck.deal
          @dealer.display_hand
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
