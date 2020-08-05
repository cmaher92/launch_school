module Armorable
  def attach_armor
  end

  def remove_armor
  end
end

module Castable
  def cast_spell(spell)
  end
end

class Player
  attr_accessor :name
  attr_reader :health, :strength, :intelligence

  def initialize(name)
    self.name = name
    self.health = 100
    @strength = roll_dice
    @intelligence = roll_dice
  end

  def heal(change_to_health)
    self.health += change_to_health
  end

  def hurt(change_to_health)
    self.health -= change_to_health
  end

  def to_s
    <<~HEREDOC
      Name: #{self.name}
      Class: #{self.class}
      Health: #{self.health}
      Strength: #{self.strength}
      Intelligence: #{self.intelligence}
    HEREDOC
  end

  private

  attr_writer :health

  def roll_dice
    rand(2..12)
  end
end

class Warrior < Player
  include Armorable

  def initialize(name)
    super(name)
    @strength += 2
  end
end

class Paladin < Player
  include Armorable
  include Castable
end

class Magician < Player
  include Castable

  def initialize(name)
    super(name)
    @intelligence += 2
  end
end

class Bard < Magician
  def create_potion
  end
end
