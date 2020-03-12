# password

# write a program that displays a welcome message
# but only after the user enters the correct password

USERNAME = 'cmaher92'
PASSWORD = 'CoNNoR'

loop do
  puts ">> Please enter your username"
  username = gets.chomp
  puts ">> Please enter your password"
  password = gets.chomp
  break if password == PASSWORD && username == USERNAME
  puts ">>Authorization failed!!"
end

puts "Welcome!"
