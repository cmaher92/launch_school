# say hello
#
# control the loop so it prints "hello" 5 times

say_hello = true
i = 0

while say_hello
  puts 'Hello!'
  i += 1
  say_hello = false if i == 5
end
