require_relative 'participant'
require_relative 'hand'

module Twenty_one
  class Dealer < Participant
    def initialize
      super
    end

    def hit?
      @hand.value < 17 && @hand.value < 22
    end
    
    def reveal_hand
      @hand.reveal
    end
    
    def display_hand
      puts "Dealer's hand"
      puts @hand
    end

    def to_s
      "Dealer"
    end
  end
end
