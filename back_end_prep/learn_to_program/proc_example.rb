# A situation in which a proc is passed into a method
# Attempting to use what I've learned in an example that I've created

# Open a cabinet
# place item
# close cabinet

def place_item_in_cabinet item
  puts '*opens cabinet*'
  item.call
  puts '*closes cabinet*'
end

can_of_soup = Proc.new do
  puts "places can of soup"
end

place_item_in_cabinet can_of_soup
