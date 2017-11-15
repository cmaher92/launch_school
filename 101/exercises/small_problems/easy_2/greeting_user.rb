# Greeting a user

# Write a program that will ask for user's name. The program will then greet
# the user. If the user writes "name!" then the computer yells back to the user.

# - get user's name
# - greet the user
# - if the user responds with an '!' at the end 
# - yell at user 

# - get user's name
# - if name[-1] == '!'
#   - yell at user
# - else 
#   - greet user 

puts "What is your name?"
name = gets.chomp
if name[-1] == '!'
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name.capitalize}."
end

# Examples
# What is your name? Bob
# Hello Bob.
# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?
