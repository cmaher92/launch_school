# Write a method that takes a string and reverses the letters in place

# Rules
# You cannot use the reverse method
# You must return the same object passed in

def reverse!(str)
  left_index, right_index = 0, (str.length - 1)

  while left_index < right_index

    str[left_index], str[right_index] = str[right_index], str[left_index]

    left_index += 1
    right_index -= 1

  end

end


p reverse!('connor') == 'ronnoc'
p reverse!('march')   == 'hcram'

puts "before reverse"
p str = 'cam'
p str.object_id
reverse!(str)
puts "after reverse"
p str
p str.object_id