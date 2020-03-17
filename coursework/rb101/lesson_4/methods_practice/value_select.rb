[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# What is the value of select? Why?
# [1, 2, 3]
# select performs selction based on the truthiness of the block's return
# value. 'hi' is always truthy, so each blue will return truthiness, so the
# original collection passed in will not change. 