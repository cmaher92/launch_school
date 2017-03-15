# Get the sum

loop do
  puts 'what does 2 + 2  equal?'
  answer = gets.chomp.to_i
  if answer == 4
    puts 'correct'
    break
  else
    'incorrect, please try again!'
  end
end
