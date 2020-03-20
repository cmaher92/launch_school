# given a hash
# keys are the title
# values are the family member's names as an array

require 'pry'

family = {  uncles: ["bob", "joe", "steve"],
    sisters: ["jane", "jill", "beth"],
    brothers: ["frank","rob","david"],
    aunts: ["mary","sally","susan"]
  }

family.select! { |k, v| k == :sisters || k == :brothers }

p family.values.flatten