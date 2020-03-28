# odd
# easy_1

# input
# integer, positive, negative, or zero
# output
# true; if the absolute value is odd
# false; if the absolute value is even

def is_odd?(n)
  n % 2 == 1 || n % 2 == -1
end

p is_odd?(9)   == true
p is_odd?(12)  == false
p is_odd?(0)   == false
p is_odd?(-11) == true
p is_odd?(-12) == false