# question_7

# In the previous exercise we added Dino to our array like this:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# flintstones << "Dino"

# How can we add multiple items to our array?
flintstones.concat(%w(Dino Hoppy))
p flintstones