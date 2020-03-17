# Even Numbers

# Print the even numbers from 1 to 99, inclusive. 
# All numbers should be printed on separate lines.

arr = Array.new(99) { |i| i+1 }
arr.each_with_index do |num, index|
  if index.odd?
    puts num
  end
end