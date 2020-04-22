# sequence count
# easy 9, problem 8

# < Integer
# < Integer
# > Array of Integers
# ! first argument represents a count
# ! second is the first number of a sequence
# ! sequence is first number doubled each time
# &
# find multiples of starting number
#   until the size of the multiples array is equal to the size argument
#   

# def sequence(size, num)
#   count = 1
#   multiples = []
#   loop do
#     break if multiples.size == size
#     multiples << num * count
#     count += 1
#   end
#   multiples
# end

def sequence(size, num)
  (1..size).map { |i| i * num }
end

p sequence(5, 1)
p sequence(4, -7)
p sequence(3, 0)
p sequence(0, 10000000)