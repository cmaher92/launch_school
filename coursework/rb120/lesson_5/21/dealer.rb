require_relative 'participant'
require_relative 'hand'

module Twenty_one
  class Dealer < Participant
    def initialize
      super
    end

    def hit?
      @hand.value < 17
    end
    
    def reveal_hand
      @hand.reveal_hand
    end
    
    def display_hand
      puts "" 
      puts "Dealer's hand"
      puts @hand
    end

    def to_s
      "Dealer"
    end
  end
end
