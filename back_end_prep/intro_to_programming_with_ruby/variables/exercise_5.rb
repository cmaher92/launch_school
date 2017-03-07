# Exercise 5
# Ruby variables

x = 0
3.times { x += 1 }
puts x
# 3

y = 0
3.times do
  y += 1
  x = y
end
puts x
# 3
