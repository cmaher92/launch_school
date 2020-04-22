# Diamonds!
# Medium 1, problem 5

# Write a method that displays a 4-pointed diamond in an n*n grid, where n
# is an odd integer that is supplied as an argument to the method.
# You may assume that the argument will always be an odd integer.

# < Integer
# > Outputs a diamond
# ! Middle line is '*' * n
# ! Each outside line is '2' * (n - 2) until n == 1
# ! Each line outside is centerd, passing in n as the argument
# &
# init stars = n
# bottom = []
# build middle line
#   - multiply the '*' by n
#   - save to init local variable 'middle' which is a string
# build bottom lines
#   - from n, down to 1
#   - n -= 2
#   - multiply '*' by stars
#   - center passing in n
# build top lines
#   - reverse bottom array
# combine
#   - diamond = top + [middle] + bottom
# display
#   - print each line out

def diamond(n)
  middle = '*' * n
  stars = n
  bottom = []
  loop do
    stars -= 2
    break if stars < 1
    bottom << ('*' * stars).center(n)
  end
  diamond = bottom.reverse + [middle] + bottom
  diamond.each { |line| puts line }
end

diamond(1)
diamond(3)
diamond(9)

