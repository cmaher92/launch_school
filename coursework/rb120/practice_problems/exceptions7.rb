# write a custom exception and implement into validate_age method

def validate_age(age)
  raise("invalid age") unless (0..105).include?(age)
end

# answer
class ValidateAgeError < StandardError; end

def validate_age(age)
  raise ValidateAgeError.new, "age is invalid" unless (0..105).include?(age)
end