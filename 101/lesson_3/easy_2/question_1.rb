# question_1

# In this hash of people and their age,
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# See if spot is taken
puts !!ages.assoc("Spot")

# or
puts ages.include?("Spot")

# or
puts ages.has_key?("Spot")