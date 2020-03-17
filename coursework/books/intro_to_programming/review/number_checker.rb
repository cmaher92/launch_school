# program
# takes a number from the user between 0 and 100
# lets user know if the number is beween 0 and 50, 51 and 100, or above 100

puts ">> Please enter a number"
num = gets.chomp.to_i

case
when num < 50 && num > 0     then puts "you entered a number between 0 and 50"
when num >= 50 && num <= 100 then puts "you entered a number between 50 and 100"
else                              puts "you entered a number above 100 or below 0"
end