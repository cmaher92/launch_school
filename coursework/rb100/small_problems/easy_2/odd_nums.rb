# Odd Numbers

# Print all odd numbers from 1 to 99, inclusive.
# All numbers should be printed on separate lines.

arr = (1..99).to_a
arr.each_with_index do |num, idx| 
  if idx.even? 
    puts num 
  end
end
