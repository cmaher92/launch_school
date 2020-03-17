# Exercise 3
# Ruby Hashes

# Using the merge method write a program that illustrates the differences

h1 = { "a" => 100, "b" => 200 }
h2 = { "b" => 254, "c" => 300 }
# h1.merge(h2) 
# => { "a" => 100, "b" => 254, "c" => 300 }
# The new value is automatically taken from the hash being merged into h1

test = h1.merge(h2) do |key, oldval, newval| 
  newval - oldval
end

p test
