# Ordering words

# Asks us to type as many words as we want
# One word per line
# Stopping only once 'Enter' key is pressed on empty line

words = []
puts 'Please enter a word on each line and I\'ll sort them'
puts 'To complete entering words, click enter on an empty line'
while true 
  response = gets
  if response == "\n"
   break
  else
    words << response.chomp.downcase
  end
end
puts words.sort.join(', ')
