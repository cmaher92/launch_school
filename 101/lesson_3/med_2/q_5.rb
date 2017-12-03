# Question 5

# How could the unnecessary duplication in this method be removed?
# answer
# simply do the comparison, if either side of the || comparison operator
# return true then the whole comparison operator will eval true
# and with Ruby's implicit return will return a boolean

def color_valid(color)
  color == "blue" || color == "green"
end
