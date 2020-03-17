# breaking chocolate problem
# split the chocolate bar into n x m squares
# each square is a size of 1x1 and unbreakable
# make a function that will return minimum number of breaks needed

# rules
# if input data is invalid return 0

# input;
# integer; non-negative; represents length
# integer; non-negative; represents width

# output
# integer; number of breaks needed to break into individual 1 by 1 squares

def break_chocolate(n, m)
  return 0 if n == 0 || m == 0
  (n * m) - 1
end

puts break_chocolate(5, 5)
puts break_chocolate(7, 4)