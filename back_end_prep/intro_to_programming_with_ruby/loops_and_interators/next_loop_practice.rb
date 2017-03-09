# Next Loop
# Ruby Loops and Iterators

# Create a loop that adds 1 each iteration, skipping 3 and 7 but breaking at 10.

i = 0

loop do
i += 1
if i == 3 || i == 7
	next
end
puts i
if i == 10
	break
end
end
