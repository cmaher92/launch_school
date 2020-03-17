# question_4

# See if the name "Dino" appears in the string below:
advice = "Few things in life are as important as house training your pet 
dinosaur"

t = Time.now
puts advice.include?("Dino")
puts Time.now - t

# solution
t = Time.now
p advice.match("life")
puts Time.now - t