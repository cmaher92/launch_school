# Print something

loop do
  puts ">> Do you want me to print something? (y/n)"
  response = gets.chomp
  if response.downcase == 'y'
    puts 'something'
    break
  elsif response.downcase == 'n'
    break
  else
    puts 'Invalid Input! Try again!'
  end
end
