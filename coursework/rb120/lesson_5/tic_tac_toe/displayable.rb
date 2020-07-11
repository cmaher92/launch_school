module Tictactoe
  module Displayable
    def display_welcome
      clear
      puts "Welcome to Tic Tac Toe!"
    end
    
    def display_winner(winning_marker)
      if winning_marker == Game::HUMAN_MARKER
        puts 'Congratulations, you have won!'
      else
        puts 'Sorry, you lost'
      end
    end
    
    def display_draw
      puts "It was a draw"
    end

    def prompt(msg)
      puts "#{msg}"
    end

    def clear
      system 'clear'
    end
  end
end
