# Passwords

PASSWORD = 'grassroots'

loop do
  puts 'Please enter your password'
  response = gets.chomp
  if response == PASSWORD
    puts 'correct'
    break
  else
    puts 'Invalid password, please try again'
  end
end
