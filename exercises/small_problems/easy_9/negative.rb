# always return negative
# easy 9, problem 3

# < Integer
# > Integer
# ! If argument is a positive number, return the negative
# ! If 0 or negative, return the original number
# &
# if number is less than 1, return number
# else, return -number

def negative(n)
  n < 1 ? n : -n
end 

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0