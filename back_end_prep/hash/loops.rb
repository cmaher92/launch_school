# Loops
# Using some of Ruby's built-in Hash methods,
# write a program that loops through a hash and prints all of the keys.
# Then write a program that does the same thing except printing the values.
# Finally, write a program that prints both.

dog = { name: 'scout', type: 'springer-spaniel', sex: 'male' }

dog.each { |k, v| puts k }
# dog.each { |k| puts k } # doesn't work, prints both keys and values
dog.each { |k, v| puts v }

dog.each do |k, v|
  puts "Key: #{k}, Value: #{v}"
end
