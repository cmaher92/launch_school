# Die class
# Playing around with some dice

class Die
  def initialize
    roll
  end
  def roll
    @number_showing = 1 + rand(6)
  end
  def showing
    @number_showing
  end
  def cheat
    puts 'please request what number you want to be showing'
    requested_die = gets.chomp
    while requested_die.to_i > 6
      puts "Please set a number that is between 1 and 6."
      requested_die = gets.chomp
    end
    @number_showing = requested_die
  end
end


die = Die.new
die.cheat
puts die.showing
