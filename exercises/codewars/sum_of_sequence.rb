
def sequence_sum(begin_number, end_number, step)
  (begin_number..end_number).step(step).reduce(0, :+)
end


puts sequence_sum(2, 6, 2)
puts sequence_sum(1, 5, 1)
puts sequence_sum(1, 5, 3)
puts sequence_sum(0, 15, 3)
puts sequence_sum(16, 15, 3)
puts sequence_sum(2, 24, 22)
puts sequence_sum(2, 2, 2)
puts sequence_sum(2, 2, 1)
puts sequence_sum(1, 15, 3)
puts sequence_sum(15, 1, 3)