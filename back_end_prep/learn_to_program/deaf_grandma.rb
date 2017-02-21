# Deaf Grandma
bye_count = 0
puts 'COME OVER HERE AND TALK TO YOUR GRANDMOTHER'
response = gets.chomp
while response
  if response != response.upcase
    puts 'HUH?! SPEAK UP, SONNY!'
    response = gets.chomp
  elsif response == response.upcase && response != 'BYE'
    random_year_int = rand(21) + 1930
    random_year_string = random_year_int.to_s
    puts 'NO, NOT SINCE ' + random_year_string + '!'
    response = gets.chomp
  elsif response == 'BYE'
    if bye_count == 0
      bye_count += 1
      puts 'Did you say GUY?!'
      response = gets.chomp
    elsif bye_count == 1
      bye_count += 1
      puts 'Ohhhh, so you said TIE?!'
      response = gets.chomp
    elsif bye_count == 2
      break
    end
  end
end
