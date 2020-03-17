# Question 10, 11

names = ['connor', 'megan', 'avery', 'john', 'cassie', 'erin', 'geyliah', 'chris']
ages = [25, 20, 17, 46, 46, 23, 23, 22]

# Create hash with names as the key and ages as the value

guests = {}
index = 0
names.each do |name|
  guests[name.to_sym] = ages[index]
  index += 1
end

# Question 11
guests[:kyle] = 24

# Question 12
# guests.delete(:megan)

# Question 13
guests.include?(:erin)

# Question 14
guests[:cassie]

# Question 15
keys = guests.keys

# Question 16
puts guests
new_hash = guests.select do |key, value|
  key == :cam
end

p new_hash

# Because it finds both megan and avery the returend hash contains both of their names and their ages but it doesn't include cam because he is not located in the hash.
# If cam is the only name searched for then it returns an empty hash


