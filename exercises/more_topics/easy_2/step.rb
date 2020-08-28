# input:
#   - starting value
#   - ending value
#   - step value
# output:
#   - nil
# rules/constraints:
#   -
# test input/output
#   -
# algorithm/data structure:
#   -

def step(start, end_value, step)
  loop do
    yield(start)
    start += step
    break if start > end_value
  end
end

step(1, 10, 3) { |value| puts "value = #{value}" }
# value = 1
# value = 4
# value = 7
# value = 10
