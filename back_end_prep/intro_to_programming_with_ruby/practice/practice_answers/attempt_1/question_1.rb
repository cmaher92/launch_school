# Practice Questions

# This loop allows the question to be asked first without having to use a workaround with the while loop.
loop do
  puts 'enter a number between 1 and 10'
  number = gets.chomp.to_i
  if number > 10 || number < 1
    next
  else
    break
  end
end

# You can use the while loop interchangeably with it.
while true
  puts 'enter a number between 1 and 10'
  number = gets.chomp.to_i
  if number > 10 || number < 1
    true
  else
    break
  end
end


