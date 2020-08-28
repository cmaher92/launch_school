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

def step(value, end_value, step)
  loop do
    yield(value)
    break if value + step > end_value
    value += step
  end
  value
end

step(1, 10, 3) { |value| puts "value = #{value}" }
# value = 1
# value = 4
# value = 7
# value = 10
