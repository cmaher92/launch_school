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

    def to_s
      "Dealer"
    end
  end
end
