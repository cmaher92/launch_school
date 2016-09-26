# iterating_over_hashes.rb

person = {name: 'connor', height: '6 ft 10 in', weight: '160 lbs', hair: 'brown'}

person.each do |key, value|
  puts "Connor's #{key} is #{value}"
end
