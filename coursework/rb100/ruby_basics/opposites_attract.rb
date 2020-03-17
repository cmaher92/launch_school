# Opposites Attract

# Request two ints from user
# Insist one int be positive, one negative
# The order doesn't matter
# Don't check for positive/negative requirement until after both ints are entered

require 'pry'

def valid_number?(number_string)
    number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def get_number
  loop do
    puts 'Please enter a positive or negative integer:'
    number = gets.chomp
    return number.to_i if valid_number?(number)
    puts '>> Invalid input. Only non-zero integers are allowed'
  end
end

int_1 = nil
int_2 = nil
loop do
  int_1 = get_number
  int_2 = get_number
  break if int_2 < 0 || int_1 < 0
  puts 'Sorry. One integer must be positive, one must be negative.'
  puts 'Please start over'
end

puts "#{int_1} + #{int_2} = #{int_1.to_i + int_2.to_i}" 
