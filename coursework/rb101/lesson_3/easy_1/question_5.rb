# question_5.rb

# Programatically determine if 42 lies between 10 and 100
# hint: use Ruby's range object in your solution

puts (10..100).cover?(42)

# ('a'..'z').cover?('yellow')
# => true

# ('a'..'z').include?('yellow')
# => false

# ('yellaa'..'yellzz').include?('yellow')
# => true