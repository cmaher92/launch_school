# question_8.rb

# One day Spot was playing with the Munster family's home computer 
# and he wrote a small program to mess with their demographic data:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

puts munsters.object_id

def mess_with_demographics(munsters)
  demo_hash = munsters
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
  puts demo_hash
end

mess_with_demographics(munsters)

puts munsters

# Does this function mess with the munsters hash?
# Yes, same object_id
# Under the hood, ruby passes the object id of each item 
# rather than the value of the parameter.