# Exercise 1

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 9, 9, 10]

# numbers.each { |num| puts num }

# Exercise 2
# numbers.each do |num|
#   if num > 5
#     puts num
#   else
#     next
#   end
# end


# Exercise 3
# new_array = numbers.select { |num| num.even? }
# p new_array

# Exercise 4
numbers << 11
numbers.unshift 0
p numbers

# Exercise 5
numbers.pop
numbers << 3
p numbers

# Exercise 6
numbers.uniq!
p numbers

# Exercise 7
# An array is a sequential list of items
# a hash contains key, value pairs to reference by key

# Exercise 8
old_style = { :old => 'yep, old' }
new_style = { new: 'yes, just look at it' }

# Exercise 9
h = {a:1, b:2, c:3, d:4}
# get the value of ':b'
h[:b]
# Add to this hash the key:value pair '{e:5}'
h[:e] = 5
# Remove all the key:value pairs whose value is less than 3.5
h.delete_if { |key, value| v < 3.5 }

# Exercise 10
# Hash value as arrays
team = { names: ['connor', 'derek', 'clinton'] }

# Array of hashes
array = [{name: 'connor'}, {name: 'sam'}, {name: 'dave'}]
