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
      deal_starting_hand
      player_turn
      player_busts if @player.bust?
      # player_turn
        # player.hit_or_stay
          # hit
            # display hit
            # player.hand << deck.deal(1)
            # display card
            # display player.hand_total
          # bust

          # display player.total > 21
      # dealer_turn
        # hit or stay
        # busts
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
          system 'clear'
          display_hands
          break if @player.bust?
        else
          puts "Player stays"
          break
        end
      end
    end
   
    def player_busts
      system 'clear'
      puts "Player busts, dealer wins."
      @dealer.reveal_hand
      @dealer.display_hand
      @player.display_hand
    end

  end
end

Twenty_one::Game.new.start
