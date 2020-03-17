# User Name and Password

USERNAME = 'cmaher92'
PASSWORD = 'grassroots'

loop do
  puts 'please enter username'
  username_try = gets.chomp
  puts 'please enter password'
  password_try = gets.chomp
  break if username_try == USERNAME && password_try == PASSWORD
  puts 'Authorization failed!'
end
puts 'welcome!'
