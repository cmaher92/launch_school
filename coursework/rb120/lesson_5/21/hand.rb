require_relative 'card'
require 'pry'

module Twenty_one
  class Hand
    HIT = [' ' * 8, ' ' * 8, ' ' * 8, 'HIT'.center(8), ' ' * 8, ' ' * 8, ' ' * 8]
    attr_reader :hand, :value

    def initialize
      @hand = []
      @value = 0
      @busted = false
    end

    def busted?
      @busted
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
      displayable_hand.join("\n")
    end

    def display_hit
      puts displayable_move_and_hand
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

    def displayable_hand
      cards = @hand.map(&:displayable)
      displayable_hand = []
      7.times do
        row = []
        cards.each do |card|
          row << card.shift
        end
        displayable_hand << row.join('')
      end
      displayable_hand
    end

    def displayable_move_and_hand
      cards = @hand.map(&:displayable)
      cards.insert(-2, HIT)
      displayable_hand = []
      7.times do
        row = []
        cards.each { |card| row << card.shift }
        displayable_hand << row.join('')
      end
      # binding.pry
      displayable_hand
    end

    def display_value
      @hand.reject { |card| card.hidden? }.map(&:value).sum
    end
  end
end

# card = Twenty_one::Card.new('J', 'Hearts')
# card2 = Twenty_one::Card.new('7', 'Spades')
# card3 = Twenty_one::Card.new('A', 'Spades')
# hand = Twenty_one::Hand.new
# hand << card
# hand << card2
# hand << card3
# hand.display_hit
# puts hand
# binding.pry
# puts hand

