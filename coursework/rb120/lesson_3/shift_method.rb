# using the << method fits well when working with a class that represents a collection

class Team
  attr_accessor :name, :members
  
  def initialize(name='')
    @name = name
    @members = []
  end 
  
  def <<(person)
    members.push person
  end
  
  def +(other_team)
    team = Team.new
    team.members =  members + other_team.members
    team
  end
  
  def [](idx)
    members[idx]
  end
  
  def []=(idx, obj)
    members[idx] = obj
  end
  
  def to_s
    members.join(', ')
  end
end

class Person
  attr_accessor :name, :age
  
  def initialize(name, age)
    @name = name
    @age    = age
  end
  
  def to_s
    self.name
  end
end

cowboys = Team.new("Dallas Cowboys")
cowboys << Person.new("Troy Aikman", 48)
cowboys << Person.new("Emmitt Smith", 46)
cowboys << Person.new("Michael Irvin", 49)


niners = Team.new("San Francisco 49ers")
niners << Person.new("Joe Montana", 59)
niners << Person.new("Jerry Rice", 52)
niners << Person.new("Deion Sanders", 47)

dream_team = cowboys + niners               # what is dream_team?
puts dream_team