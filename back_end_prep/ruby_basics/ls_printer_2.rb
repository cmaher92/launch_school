# Launch School Printer

# Ask user how many lines do you want
# set number of lines to int
# if number of lines is higher than 3 break
# output lines
# now ask the user again how many lines wants

loop do
  puts '>> How many output lines do you want?'
  puts '>> Must be 3 or more.'
  requested_lines = gets.chomp.to_i
  if requested_lines >= 3
    while requested_lines > 0
      puts "Launch School is the best!"
      requested_lines -= 1
    end
  else
    puts 'Please enter a number that is 3 or greater'
  end
end
