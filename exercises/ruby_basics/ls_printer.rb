# ls printer

# write a program that prints 'Launch School is the best!' repeatedly
# until a certain amount of lines have been printed
# the number of lines should be retrieved from the user, and should insist
# that at least 3 lines be printed

line = "Launch School is the best!"
response = 0

loop do
puts ">> How many lines do you want to print?"
response = gets.chomp.to_i
break if response >= 3
puts ">>That's not enough lines"
end

response.times { puts(line) }
