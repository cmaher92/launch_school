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
      system 'clear'
      deal_starting_hand
      puts ""
      puts ""
      puts "Dealers hand"
      display_hand(@dealer)
      puts ""
      puts ""
      puts ""
      puts ""
      puts "Your hand"
      display_hand(@player)
      puts ""
      # player_turn
        # display player.hand
        # display player.hand_total
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
      puts "Dealer is dealing a new hand..."
      @player.hand << @deck.deal
      @dealer.hand << @deck.deal.hide
      @player.hand << @deck.deal
      @dealer.hand << @deck.deal
    end

    def display_hand(participant)
      puts participant.hand
    end

  end
end

Twenty_one::Game.new.start
