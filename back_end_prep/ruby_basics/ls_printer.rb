# Launch school printer

loop do
  puts ">> How many output lines do you want? Enter a number > 3:"
  number_of_lines = gets.chomp.to_i
  if number_of_lines < 3
    puts 'Invalid input. Please enter a number greater than 3'
  else
    until number_of_lines == 0
      puts 'LS is the best!'
      number_of_lines -= 1
    end
    break
  end
end


