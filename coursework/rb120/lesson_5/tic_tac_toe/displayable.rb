module Tictactoe
  module Displayable
    def welcome
      clear
      puts "Welcome to Tic Tac Toe!"
    end

    def prompt(msg)
      puts "#{msg}"
    end

    def clear
      system 'clear'
    end
  end
end
