puts 'What\'s your first name?'
first_name = gets.chomp
puts 'What\'s your middle name?'
middle_name = gets.chomp
puts 'What\'s your last name?'
last_name = gets.chomp
full_name_length = first_name.length + middle_name.length + last_name.length
puts full_name_length
