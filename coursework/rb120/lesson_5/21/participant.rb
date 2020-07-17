require_relative 'hand'
require_relative 'card'

module Twenty_one
  class Participant
    attr_accessor :hand

    def initialize()
      @hand = Hand.new
    end

    def bust?
      # handle case where there is an Ace in the hand
      @hand.value > 21
    end
    
    def new_hand
      @hand = Hand.new
    end
  end
end
