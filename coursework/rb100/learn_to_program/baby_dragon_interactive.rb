# Interactive baby dragon

# Let's you enter commands such as feed and walk and calls those
# methods on your dragon
# Since you are inputting strings you will need some sort of method dispatch

load 'baby_dragon.rb'
# how to properly include a file



dragon = Dragon.new 'ZaZu'
puts "Your new dragon #{dragon.name} has been born"
while dragon
  puts "Would you like to feed, walk, or have your dragon sleep?"
  task = gets.chomp
  if task == 'feed'
    dragon.feed
  elsif task == 'walk'
    dragon.walk
  elsif task == 'sleep'
    dragon.put_to_bed
  end
end
