# does my list include this

# input: array, obj
# output: boolean
# rules:
#   do not use Array#include?

def include?(ary, v)
  ary.any? { |e| e == v }
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false