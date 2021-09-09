# always_return_negative.rb

# input
# - integer
# output
# - integer

# if the argument is <= 0, return argument
# if the argument is > 0, return the negative of the argument

def negative(n)
  return n if n <= 0
  -n
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby
