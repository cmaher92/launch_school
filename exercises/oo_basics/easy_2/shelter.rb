class Pet
  attr_reader :name, :species
  def initialize(species, name)
    @species = species
    @name    = name
  end
end

class Owner
  attr_reader :number_of_pets, :name
  def initialize(name)
    @name = name
    @number_of_pets = 0
  end

  def adopt_pet
    @number_of_pets += 1
  end
end

class Shelter
  def initialize
    @adoptions = {}
  end

  def adopt(owner, pet)
    # if owner has adopted pet, add to value
    # otherwise create key, value in adoptions hash
    @adoptions.has_key?(owner) ? @adoptions[owner] << pet : @adoptions[owner] = [pet]
    owner.adopt_pet
  end

  def print_adoptions
    @adoptions.each do |owner, pets|
      puts "#{owner.name} has adopted the following pets"
      pets.each do |pet|
        puts "a #{pet.species} named #{pet.name}"
      end
      puts ""
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
