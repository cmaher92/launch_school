# Exercise 1

require 'pry'

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
h.delete_if { |key, value| value < 3.5 }

# Exercise 10
# Hash value as arrays
team = { names: ['connor', 'derek', 'clinton'] }

# Array of hashes
array = [{name: 'connor'}, {name: 'sam'}, {name: 'dave'}]

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

# Exercise 12
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

# contacts['Joe Smith'][:email] = contact_data[0][0]
# contacts['Joe Smith'][:address] = contact_data[0][1]
# contacts['Joe Smith'][:phone] = contact_data[0][2]
# contacts['Sally Johnson'][:email] = contact_data[1][0]
# contacts['Sally Johnson'][:address] = contact_data[1][1]
# contacts['Sally Johnson'][:phone] = contact_data[1][2]
#
# p contacts

# Exercise 13
# joes_email = contacts['Joe Smith'][:email]
# sallys_phone = contacts['Sally Johnson'][:phone]

# Exercise 14
# contacts.each do |key, value|
#   # set email, address, and phone
#   value[:phone] = contact_data[0].pop
#   value[:address] = contact_data[0].pop
#   value[:email] = contact_data[0].pop
#   contact_data.shift
# end
#
# p contacts


# Exercise 15
# arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
# arr.delete_if do |word|
#   word.start_with?('s') || word.start_with?('w')
# end
# p arr

# Exercise 16
a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
# Use map, flatten and split
a.map! { |word| word.split(/ /) }
p a.flatten

# Exercise 17
true
