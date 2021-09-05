# What's My Value? (Part 10)

a = 7
array = [1, 2, 3]

def my_value(arr)
  arr.each do |b|
    a += b
  end
end

my_value(array)
puts a