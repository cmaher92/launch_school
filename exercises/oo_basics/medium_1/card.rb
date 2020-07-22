require 'pry'

class Card
  include Comparable
  attr_reader :rank, :suit

  RANKS = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    value <=> other.value
  end

  def value
    RANKS.fetch(@rank, @rank)
  end

  def to_s
    "#{@rank} of #{@suit}"
  end
end
