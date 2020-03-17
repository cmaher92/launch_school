# say hello
# modify the code to make 'Hello' print five times

say_hello = true
iterations = 0

while say_hello
  puts 'Hello!'
  iterations += 1
  say_hello = false if iterations == 5
end
