# Question 17

player = { name: 'Derek', age: 24, height: '74 inches', goals: 22, assists: 17 }
new_information = { recruited: true, state: 'MA', rating: 8 }

puts player.merge!(new_information)

# Question 18
player.delete(:assists)
puts player
