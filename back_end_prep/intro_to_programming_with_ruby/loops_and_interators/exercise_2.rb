# Exercise 2
# Ruby Loops and Iterators

# Write a while loop that takes input from the user, performs an action, and only stops when the user types 'STOP'. Each loop can get info from the user.

loop do
  puts 'just tell me when you want me to stop'
  response = gets.chomp
  if response == 'stop'
    break
  end
end
