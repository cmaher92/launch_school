# number_game.rb
# Write a program that takes a number from 0 - 100
# and reports back whether the number is between
# 0 and 50, 51 and 100, or above 100
require 'pry'

puts "Please choose a number"
number = gets.chomp.to_i

def check_if_number(number)
  if number < 0
    puts "You can't have a negative number"
  elsif number <= 50
    puts "#{number} is between 0 and 50"
  elsif number <= 100
    puts "#{number} is between 51 and 100"
  else
    puts "#{number} is above 100"
  end
end

def check_case_number(number)
  case
  when number < 0
    puts "#{number} is negative, that's not allowed"
  when number >= 0 && number <= 50
    puts "#{number} is between 0 and 50"
  when number > 50 && number <= 100
    puts "#{number} is between 51 and 100"
  else
    puts "#{number} is above 100"
  end
end

def check_case2_number(number)
  case number
  when 0..50
    puts "#{number} is between 0 and 50"
  when 50..100
    puts "#{number} is between 51 and 100"
  else
    if number < 0
      puts "You can't enter a negative number!"
    else
      puts "#{number} is above 100"
    end
  end
end

check_case2_number(number)
check_if_number(number)
check_case_number(number)
