require_relative 'participant'
require_relative 'hand'

module Twenty_one
  class Player < Participant
    def initialize
      super
    end

    def hit?
      return false if @hand.value == 21
      response = nil
      puts "-"
      puts "Would you like to hit or stay? (h/s)"
      loop do
        response = gets.chomp.downcase
        break if %w(h hit s stay).include?(response)
        puts "Invalid response, please try again."
      end
      %w(h hit).include?(response) ? true : false
    end

    def display_hand
      puts "Your hand"
      puts @hand
      puts ""
    end
  end
end
