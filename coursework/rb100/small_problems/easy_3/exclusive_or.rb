# Exclusive Or
#
# The || operator returns a truthy value if either or both of its operands are
# truthy, a falsey value if both operands are falsey. The && operator returns a
# truthy value if both of its operands are truthy, and a falsey value if either
# operand is falsey. This works great until you need only one of two conditions
# to be truthy, the so-called exclusive or.
#
# In this exercise, you will write a method named xor that takes two arguments,
# and returns true if exactly one of its arguments is truthy, false otherwise.

# given two arguments
# return true only if one argument is truthy
# otherwise false

# if the first argument is true and the second argument is false return true
# if the first argument is false and the second is true return true

# if the first argument is false and the second is false return false
# if the first argument is true and the second argument is true return false

# def xor?(first, second)
#   if first == true && second == false
#     true
#   elsif first == false && second == true
#     true
#   else
#     false
#   end
# end

def xor?(value1, value2)
  return true if value1 && !value2
  return true if !value1 && value2
  false
end

def xor?(value1, value2)
  # return true if either of these conditions are true
  # otherwise returns false
  (value1 && !value2) || (!value1 && value2)
end

# Examples:
puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false
