count = 1

loop do
  break if count == 6
  if count.odd?
    puts "It's odd!"
  else
    puts "It's even!"
  end
  count += 1
end 