# 99 bottles

bottle_count = 99
while bottle_count > 0
  puts 'There are ' + bottle_count.to_s + ' bottles of beer on the wall'
  puts bottle_count.to_s +  ' bottles of beer'
  puts 'Take one down, pass it around'
  puts 'Now they\'re are, ' + bottle_count.to_s + ' bottles of beer on the wall'
  puts  
  bottle_count -= 1
end
