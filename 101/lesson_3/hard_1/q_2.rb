=begin
Question 2

What is the result of the last line in the code below?
=end

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings          #  => {a: 'hi'}
