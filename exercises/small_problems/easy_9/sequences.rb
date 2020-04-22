# counting up
# easy 9, problem 4

# < Integer
# > Array
# ! creates an array from 1..Integer and returns
# ! You may assume that the argument will always be a valid integer that is > 0
# ! handle negative arguments
# &
# Initialize a Range from 1..n if positive, otherwise n..0 if negative
# convert to an array

def sequence(n)
  n < 1 ? (n..0).to_a : (1..n).to_a
end


p sequence(5)  == [1, 2, 3, 4, 5]
p sequence(3)  == [1, 2, 3]
p sequence(1)  == [1]
p sequence(0)  == [0]
p sequence(-3) == [-3, -2, -1, 0]