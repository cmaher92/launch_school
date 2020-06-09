class Move
  VALUES = ['rock', 'paper', 'scissors', 'spock', 'lizard']
  @@moves = []

  def initialize
    if @@moves.empty?
      @@moves << [self]
    elsif @@moves.last.size == 2
      @@moves << [self]
    else
      @@moves.last << self
    end
  end

  def self.moves
    @@moves
  end

  def to_s
    "#{self.class}"
  end
end

class Rock < Move
  def >(other_move)
    # return true if other move is scissors or lizard
    other_move.class == Scissors || other_move.class == Lizard
  end

  def <(other_move)
    # return true if other move is spock or paper
    other_move.class == Paper || other_move.class == Spock
  end
end

class Paper < Move
  def >(other_move)
    other_move.class == Rock || other_move.class == Spock
  end

  def <(other_move)
    other_move.class == Scissors || other_move.class == Lizard
  end
end

class Scissors < Move
  def >(other_move)
     other_move.is_a?(Paper) || other_move.is_a?(Lizard)
  end

  def <(other_move)
    other_move.class == Rock || other_move.class == Spock
  end
end

class Spock < Move
  def >(other_move)
    other_move.class == Rock || other_move.class == Scissors
  end

  def <(other_move)
    other_move.class == Lizard || other_move.class == Paper
  end
end

class Lizard < Move
  def >(other_move)
    other_move.class == Spock || other_move.class == Paper
  end

  def <(other_move)
    other_move.class == Rock || other_move.class == Scissors
  end
end

my_move = Spock.new
computer_move = Paper.new
Lizard.new
Lizard.new
Lizard.new
p Move.moves
