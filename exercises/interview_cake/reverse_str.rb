# Write a method that takes a string and reverses the letters in place

# < String
# > nil
# ! mutate the argument string

# given a string
# 'connor'
# swap pairs of characters
#   swap pairs beginning with the outside chracters, moving inwards
#   the number of times to swap is half the length of the string, if it's odd that character doesn't need to be swapped

# swap logic
#   - first, last begin at 0 and -1 respectively
#   - str[first], str[last] = str[last], str[first]
#   - increment first, decremement last

def reverse_str(str)
  left_index, right_index = 0, (str.length - 1)

  while left_index < right_index

    str[left_index], str[right_index] = str[right_index], str[left_index]

    left_index += 1
    right_index -= 1

  end

end

first_name = 'connor'
reverse_str(first_name)
p first_name == 'ronnoc'