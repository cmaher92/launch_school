# In the age hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# throw out the really old people (age 100 or older).

# p ages.select { |_, v| v < 100 }

p ages.reject { |_, v| v >= 100 }
