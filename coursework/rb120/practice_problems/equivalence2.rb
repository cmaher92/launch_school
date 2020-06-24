# write the case statement as an if statement
# demonstrating how the === operator is overridden by
# the Range class

num = 15
case num
when (1..15)
  puts 'yep'
when (16..30)
  puts 'hi'
end
