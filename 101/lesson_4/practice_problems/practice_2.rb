# Add up all the ages of the munster family hash
ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 5843,
  "Eddie" => 10,
  "Marilyn" => 22,
  "Spot" => 237
}

# solution 1
# I call the #values method on the hash that returns an arr of value
# I then reduce the returned arr passing in the #+ method on each
# value of the array
# this ultimately returns the summed ages
# I believe this is concise and as clear as it can get.
# p ages.values.reduce(:+)

# solution 2
# wanted to use each_with_object again and learned that the obj
# can't be an immutable object. There is only 1 instance of each
# number in ruby, so stick with mutable objects when using.
total = ages.each_with_object([]) do |(k, v), sum|
  sum << v
end
p total.reduce(:+)
