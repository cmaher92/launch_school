# For loop
# Loops and Iterators

# Create a loop that iterates beginning at 1 up to the number the user entered

puts 'please enter a number that is not a negative'
x = gets.chomp.to_i

returned = for i in 1..x do
  puts i
end

puts "Done iterating!"
puts returned.inspect
