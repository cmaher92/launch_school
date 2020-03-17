# Perform Again
# Ruby Loops and Iterators

# Ask a user if they want to 'do that again' and if they don't break the loop, otherwise ask again

loop do
  puts 'do you want to do that again? (Y/N)'
  answer = gets.chomp
  if answer != 'Y'
    break
  end
end

