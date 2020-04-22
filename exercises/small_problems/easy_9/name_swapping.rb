# name swapping
# easy 9, problem 7

# < str
# > str
# ! output str joined with ', '
# &
# split the string
# parallel assign variables
  # str[0], str[1] = str[1], str[0]
# join and return

def swap_name(name)
  arr = name.split
  arr[0], arr[1] = arr[1], arr[0]
  arr.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'