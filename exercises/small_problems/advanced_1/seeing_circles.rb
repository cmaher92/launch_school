# circle
# Further Exploration
# What other patterns can you come up with that can be produced in similar ways
# to the patterns of this exercise? Can you draw a reasonable looking circle?

circle(16)
        ****
     **      **
   **          **
  **            **
   **          **
     **      **
        ****

# input
# n - widest point of the circle, including stars, always even
# output
# circle printed
# rules
# each outer row decreases by 4 spaces
# each row contains 4 stars
# the smallest circle will be 16

# the top of the circle and the bottom will always be four stars
# centered on the passed in n value
# the remaining lines up to the middle line will start with four spaces,
# increasing by 2 each time, centered on the n value
# after hittin the middle, each line will decrease until the line length
# is half of the passed in number
# then the final line is printed which is again 4 stars

# algorithm
# circle
#   print 4 stars centered
#   max
