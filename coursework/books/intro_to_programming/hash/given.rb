# Given
# Given a hash of family members, with keys as the title and an array of names as
# the values, use Ruby's built-in select method to gather only immediate family
# members' names into a new array.

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

immediate_family = family.select do |key, value|
  key == :sisters || key == :brothers
end

# Takes the hash and turns it into an array, and then takes that array and
# flattens to a one-dimensional array
my_family = immediate_family.to_a.flatten
p my_family
