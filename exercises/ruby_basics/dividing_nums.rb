# obtain 2 ints from the user
# prints the results of diving the first by the second
# the second must not be 0

numerator = 0
denominator = 0

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

loop do
  puts ">> Please enter the numerator"
  numerator = gets.chomp
  break if valid_number?(numerator)
  puts ">> Invalid input. Only integers allowed."
end

loop do
  puts ">> Please enter the denominator"
  denominator = gets.chomp
  break if valid_number?(denominator) && denominator != '0'
  if valid_number?(denominator) == false
    puts ">> Invalid input. Only integers allowed."
  else
    puts ">> Invalid input. A denominator of 0 is not allowed."
  end
end

puts "#{numerator} / #{denominator} is #{numerator.to_i/denominator.to_i}"
