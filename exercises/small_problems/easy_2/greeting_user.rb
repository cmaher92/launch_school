# Greeting a user
# Write a program that will ask for user's name. 
# The program will then greet the user. 
# If the user writes "name!" then the computer yells back to the user.

# - Input:
#   - String: user-input, user_name
# - Output:
#   - String: printed-to-STDOUT, greets the user
# - Rules:
#   - if the user_name contains a '!' at the end, yell at user
# - Data Structure:
#   - String: allows regex matching
# - Algorithm:
    # - retrieve user name
    # - see if the str includes '!' and respond based on if it does
    #   - if true, yell at the user
    #   - if false, say hello

require 'pry'

def greet_user
  puts "What is your name?\n"
  name = gets.chomp
  /!/.match?(name, -1) ? puts("HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?") : puts("Hello #{name.capitalize}.") 
end

greet_user
  

# Examples
# What is your name? Bob
# Hello Bob.
# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?