# question_7

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

# If we take advantage of Ruby's Kernel#eval method to have it execute this 
# string as if it were a 'recursive' method call

puts eval(how_deep)

# What will be the result?
# 42
