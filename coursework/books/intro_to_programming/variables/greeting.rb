# Greeting.rb
# Write a program that prints a greeting message.
# This should contain a method called greeting that takes
# A name as it's parameter and returns a string

def greeting(name)
  "Hello #{name}, how are you?"
end

"What is your name?:"
name = gets.chomp
puts greeting(name)
