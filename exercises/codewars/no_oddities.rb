# no oddities here
# https://www.codewars.com/kata/51fd6bc82bc150b28e0000ce

# input
#   array
# output
#   array; values that are not odd


def no_odd( values )
  values.select &:even?
end

p no_odd([0,1])
p no_odd([0,1,2,3])
