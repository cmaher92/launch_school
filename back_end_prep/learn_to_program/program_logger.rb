# Program logger

# Write a method called log that takes a string description of a block
# and a block
# it should puts a string telling you it started the block
# and another string telling you it finished and also telling you
# what the block returned

# test by sending a code block

$nesting_depth = 0

def log string_description, &block
  $nesting_depth += 1
  spaces = ''
  $nesting_depth.times do
    spaces = spaces + '  '
  end
  puts spaces + "starting block"
  returned_value = block.call
  puts spaces + "finishing block"
  puts "#{string_description} returned #{returned_value}"
end

log 'outer_block' do
  log 'inner_block' do
    5
  end
  10
end
