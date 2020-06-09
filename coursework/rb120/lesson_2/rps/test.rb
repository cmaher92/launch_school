class Rock
end

class Scissors
end

class Paper
end

class Spock
end

class Lizard
end

class Dog
  def initialize
    @personality = { 
      Rock.new => 6, 
      Scissors.new => 1,
      Paper.new => 1,
      Spock.new => 1,
      Lizard.new => 1 
    }
  end

  def choose
    moves = []
    @personality.map do |move, freq|
      freq.times { moves << move.dup }
    end
    moves
  end
end

archie = Dog.new
p archie.choose
