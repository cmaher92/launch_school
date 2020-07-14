require_relative 'card'
require 'pry'

module Twenty_one
  class Hand
    attr_reader :hand, :value

    def initialize
      @hand = []
      @value = 0
    end

    def <<(card)
      @hand << card
      @value += card.value
    end

    def to_s
      puts displayable_hand
      "Showing: #{display_value}"
    end

    private

    def display_value
      @hand.reject { |card| card.hidden? }.reduce { |card| card.value }
    end

    def displayable_hand
      cards = @hand.map { |card| card.displayable }
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

    def display_value
      @hand.reject { |card| card.hidden? }.map(&:value).sum
    end
  end
end

# card = Twenty_one::Card.new('J', 'Hearts')
# card2 = Twenty_one::Card.new('7', 'Spades')
# hand = Twenty_one::Hand.new
# hand << card
# hand << card2
# hand << card2
# hand << card2
# hand << card2
# puts hand
# card3 = Twenty_one::Card.new('2', 'Clubs')
