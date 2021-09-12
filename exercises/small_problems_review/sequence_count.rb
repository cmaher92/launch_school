# sequence_count.rb

# IO
# < COUNT (int), START (int)
# > sequence (array)

# RULES
# the size of the sequence is determined by COUNT
# each number in the sequence is a multiple of START

# ALGORITHM
# create an array with COUNT number of elements
#   pass a block and define the block var as i (the index)
#   - add one to i
#   - multiply i + 1 by START

# def sequence(count, start)
#   Array.new(count) { |i| (i + 1) * start }
# end

def sequence(count, start)
  (1..count).map { |v| v * start }
end

# examples
p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
