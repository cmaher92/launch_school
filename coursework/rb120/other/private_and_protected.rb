class Bottle
  def public_tester
    public_method
  end

  def public_method
    puts "public"
  end

  def private_tester
    private_method
  end

  def private_tester_two
    self.private_method
  end

  private
  def private_method
    puts "private"
  end
end

# public outside
Bottle.new.public_method

# public inside
Bottle.new.public_tester

# private outside
# Bottle.new.private_method

# private inside called without an explicit receiver
Bottle.new.private_tester

class Person
  def initialize(name)
    @name = name
  end

  def name_longer?(other)
    name.length == other.name.length
  end

  private
  attr_reader :name
end

connor = Person.new('connor')
skylar = Person.new('skylar')
connor.name_longer?(skylar)
