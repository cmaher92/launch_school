# given the following method, pass in a random integer and handle the exception, print the error's message

def validate_age(age)
  raise("invalid age") unless (0..105).include?(age)
end

begin
  age = rand(500)
  validate_age age
rescue RuntimeError => e
  puts e.message
ensure
  puts age
end