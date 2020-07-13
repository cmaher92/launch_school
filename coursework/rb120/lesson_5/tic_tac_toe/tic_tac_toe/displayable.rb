module Tictactoe
  module Displayable
    BLANK_SPACE = ""
    def display_welcome
      clear
      puts BLANK_SPACE
      puts "Welcome to Tic Tac Toe!"
      puts BLANK_SPACE
    end

    def display_final_board
      if @winner == Game::HUMAN_MARKER
        puts "Result: Human win"
      elsif @winner == Game::COMPUTER_MARKER
        puts "Result: Computer win"
      else
        puts "Result: Draw"
      end
      @board.draw
    end

    def display_winner(winning_marker)
      puts BLANK_SPACE
      if winning_marker == Game::HUMAN_MARKER
        puts 'Congratulations, you have won!'
      else
        puts 'Sorry, you lost'
      end
    end

    def display_draw
      puts BLANK_SPACE
      puts "It was a draw"
    end

    def prompt(msg)
      puts msg
    end

    def clear
      system 'clear'
    end
  end
end
