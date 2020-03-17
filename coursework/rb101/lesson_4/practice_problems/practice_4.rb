# Pick out the min. age for the hash
ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 5843,
  "Eddie" => 10,
  "Marilyn" => 22,
  "Spot" => 237
}

# Here I take the ages hash and call the Hash#values method which
# returns an array of the values
# Then I call the Enumerable#min method on the hash that was returned

p ages.values.min
