require_relative 'card'
require 'pry'

module TwentyOne
  class Hand
    HIT = [' ' * 5, ' ' * 5, ' ' * 5, 'HIT'.center(5), ' ' * 5, ' ' * 5, ' ' * 5]
    attr_reader :hand, :value

    def initialize
      @hand = []
      @value = 0
      @busted = false
    end

    def busted?
      @busted
    end
    
    def blackjack?
      @hand.first(2).map(&:value).sum == 21
    end
    
    def reveal
      @hand.each { |card| card.reveal }
    end

    def <<(card)
      @hand << card
      @value += card.value
      calc_value_for_ace if ace?
      @busted = true if @value > 21
    end

    def >(other_hand)
      @value > other_hand.value
    end

    def ==(other_hand)
      @value == other_hand.value
    end

    def to_s
      displayable_move_and_hand.join("\n")
    end

    private

    def ace?
      @hand.any?(&:ace?)
    end

    def calc_value_for_ace
      if @value > 21
        @hand.select(&:ace?).first.value = 1 # set aces value to 1
        @value -= 10
      end
    end

    def displayable_value
      value = @hand.reject { |card| card.hidden? }.map(&:value).sum
      [' ', ' ', ' ', "#{"TOTAL:".center(8)}", "#{value.to_s.center(8)}", ' ', ' ']
    end

    def displayable_move_and_hand
      cards = @hand.map(&:displayable)

      # add HITs
      cards_and_hits = []
      cards.each_with_index do |card, idx|
        cards_and_hits << HIT if idx > 1
        cards_and_hits << card
      end

      # add score
      cards_and_hits << displayable_value

      # combine cards, hits, score so they can display next to each other
      displayable_hand = []
      7.times do |row_idx|
        row = []
        cards_and_hits.each { |card| row << card[row_idx] }
        displayable_hand << row.join('')
      end
      # binding.pry
      displayable_hand
    end

  end
end
