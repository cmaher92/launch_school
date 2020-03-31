# convert signed number to string

# input
#   integer
# output
#   string, including the sign
# algorithm
#   - if less than zero, append sign to front

require_relative 'int_to_string'

def signed_integer_to_string(n)
  n < 0 ? "-#{integer_to_string(n.abs)}" : n == 0 ? '0' : "+#{integer_to_string(n)}"
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'