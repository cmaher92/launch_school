require_relative 'participant'
require_relative 'hand'

module Twenty_one
  class Player < Participant
    def initialize
      super
    end

    def hit?
      response = nil
      puts "Would you like to hit? (y/n)"
      loop do
        response = gets.chomp.downcase
        break if %w(y yes n no).include?(response)
        puts "Invalid response, please try again."
      end
      %w(y yes).include?(response) ? true : false
    end

    def display_hand
      puts ""
      puts "Your hand"
      puts @hand
    end

    def display_hit
      @hand.display_hit
    end
  end
end
