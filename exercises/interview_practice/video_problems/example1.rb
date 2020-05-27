# take a string as an argument, return string in reverse order


# input:
#   - String
# output:
#   - String
# rules/constraints:
#   -
# test input/output
#   - 'connor' -> 'ronnoc'
# algorithm/data structure:
#   -

def reverse_str(str)
  new_str = ''
  idx = str.length - 1
  while idx >= 0
    new_str << str[idx]
    idx -= 1
  end
  new_str
end

p reverse_str('connor')
