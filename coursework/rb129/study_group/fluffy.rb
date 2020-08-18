# today's session went over encapsulation, custom#to_s and lexical scope.
# For a project we are combining collab objects and oo design concepts:
# Given a pet fluffy, the owner and the owner's friend, design 3 classes,
# map relationships and write some code in a way that will output the following:

# Pet
# - name
# - owner(setter)
# # owner(getter) -> calls #name method on owner
# # to_s

# Person
# - name(setter)
# - name(getter)
# - friend -> "Hi, my name is #{friend.name} and I'm a good friend"
#   - when retrieving friend's name, capitalize
# - #to_s -> "Hi, I'm #{name.capitalize} and I have a friend"

require 'pry'

class Person
  attr_accessor :name
  attr_writer :friend

  def initialize(name)
    self.name = name
  end

  def friend
    puts "Hi, my name is #{@friend.name.capitalize} and I'm a good friend"
  end

  def to_s
    greeting = "Hi, I'm #{self.name.capitalize}"
    self.friend ? (greeting + " and i have a friend") : greeting
  end
end

bob = Person.new('BoB')
puts bob

joe = Person.new('joE')
bob.friend = joe
puts bob

binding.pry

puts joe.name
puts bob.friend.name
puts bob.friend


# puts fluffy # My name is fluffy and my owner's friend's name is Joe
# puts fluffy.owner # Hi, I'm Bob and i have a friend
# puts fluffy.owner.friend # Hi, my name is Joe and I'm a good friend
# puts fluffy.name # FLUFFY
# puts fluffy.owner.name # BoB
# puts fluffy.owner.friend.name #joE
