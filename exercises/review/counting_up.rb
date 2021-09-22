# counting_up.rb

# input
# - integer
# output
# - array of all integers, in sequence, between 1 and the argument
# rules
# - argument will always be a valid integer that is greater than 0
#

def sequence(n)
  return (1..n).to_a if n > 0
  return (n...0).to_a if n <= 0
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-1)
