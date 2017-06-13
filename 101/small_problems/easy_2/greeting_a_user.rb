# greeting a user

# Write a program that will ask for user's name. The program will then greet 
# the user. If the user writes "name!" then the computer yells back to the user.

# Examples
# What is your name? Bob
# Hello Bob.
# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?

# understanding the problem
# input
#   name: user inputted string
# output
#   response: print a greeting back to user

# algorithm
# parse the string to see if it contains '!' 
#   use String#include
# if name contains '!'
#   remove '!' from name
#       name[/!/]
#   print out yelling response
# else
#   print out regular response

puts "What is your name?"
name = gets.chomp!

if name.include?('!')
    name.chop!
    puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
    puts "Hello #{name.capitalize}."
end