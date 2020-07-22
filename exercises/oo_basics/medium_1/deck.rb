require_relative 'card'
require 'pry'

class Deck
  include Comparable
  attr_reader :deck

  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    build_deck
  end

  def draw
    build_deck if @deck.empty?
    @deck.pop
  end

  private

  def build_deck
    @deck = RANKS.product(SUITS).map { |rank, suit| Card.new(rank, suit) }
    @deck = @deck.shuffle
  end
end
