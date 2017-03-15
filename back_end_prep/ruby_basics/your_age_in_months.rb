# Your age in months

puts 'What is your age in years?'
age_in_years = gets.chomp
age_in_months = age_in_years.to_i * 12
puts "Your are #{age_in_months} months old."
