# Loop on command

loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  if answer == 'yes'
    break
  end
end
