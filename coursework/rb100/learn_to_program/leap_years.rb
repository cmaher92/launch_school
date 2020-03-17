# Leap years

# Asks for staying year & ending year
# prints all the leap years in between them, including both starting and ending years provided

# leap years are years divisible by 4, years divisible by 100 are not leap years

puts 'Leap Years'
puts 'I can list the leap years in between a starting year and an ending year'
puts 'What year would you like to start at?'
starting_year = gets.chomp
puts 'What year would you like to end at?'
ending_year = gets.chomp
# starting_year = 1982
# ending_year = 2016
year = starting_year.to_i
puts year
leap_years = []
puts ending_year.to_i
while year <= ending_year.to_i
  if year % 4 == 0 && year % 100 != 0
    leap_years << year
    year += 1
  elsif year % 400 == 0
    leap_years << year
    year += 1
  else
    year += 1
  end
end
line_width = 60
puts '---------------'.center(line_width)
puts 'LEAP YEARS'.center(line_width)
puts '---------------'.center(line_width)
puts leap_years
