=begin
Madlibs

Mad libs are a simple game where you create a story template with blanks for 
words. You, or another player, 
then construct a list of words and place them into the story,
creating an often silly or funny story as a result.

Create a simple mad-lib program that prompts for a noun, a verb, an adverb, 
and an adjective and injects those into a story that you create.

input
  user-input
output
  string using the user-input
  
# prompt user for a noun
# prompt user for a verb
# prompt user for a adjective
# prompt user for an adverb

# define a prompt method, that takes a string

# puts the story
=end

def prompt(str)
  puts "Enter a #{str}:"
  gets.chomp
end

noun = prompt('noun')
verb = prompt('verb')
adjective = prompt('adjective')
adverb = prompt('adverb')

puts "Do you #{verb} with your #{adjective} #{noun} #{adverb} often? Jealous!"

# Example
# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly

# Do you walk your blue dog quickly? That's hilarious!