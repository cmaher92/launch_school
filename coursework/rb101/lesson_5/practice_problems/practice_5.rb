# Given this nested Hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# figure out the total age of just the male members of the family.

# input
#   hash of hashes
# output
#   integer, total age of the male members of the family

# iterate through the inputted hash of hashes
#   select the hashes where gender == male
# map each male_munsters to just the age, then reduce


male_munsters = munsters.select do |_, v|
  v['gender'] == 'male'
end

p male_munsters.map { |_, v| v['age'] }.reduce(:+)
