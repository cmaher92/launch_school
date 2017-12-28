# What is the type of action being performed (method call, block, conditional, etc..)?
# What is the object that action is being performed on?
# What is the side-effect of that action (e.g. output or destructive action)?
# What is the return value of that action?
# Is the return value used by whatever instigated the action?

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]

# 1. Method call: #map, object: outer array, side-effect: none,
#    return value: new array, used by instigator?: no, but shown
# 2. action: block, object: each sub-array, side-effect: none,
#    return value: nil, return value used?: yes, for transformation
# 3. method call: first, object: sub-array, side-effect: none
#    return value: element at index 0, used?: yes by puts
# 4. method call: puts, object: element at index 0,
#    side-effect: outputs a string representation of integer
#    used? yes, to determine return value of block
