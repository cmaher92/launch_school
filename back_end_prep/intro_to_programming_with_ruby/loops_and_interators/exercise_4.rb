# Exercise 4
# Ruby Loops and Iterators

# Write a method that counts down to zero using recursion

def countdown number
  if number <= 0
    puts number
  else
    puts number
    countdown(number - 1)
  end
end

countdown 9
