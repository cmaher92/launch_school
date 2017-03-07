# Grandfather clock

# write a method that takes a block
# and calls it once for each hour that has passed today


def grandfather_clock &block
  current_hour = Time.new.hour
  if current_hour > 12
    current_hour = current_hour - 12
    current_hour.times do
      block.call
    end
  else
    current_hour.times do
      block.call
    end
  end
end

grandfather_clock do
  puts 'dong'
end
