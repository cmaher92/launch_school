=begin
Welcome Stranger

Create a method that takes 2 arguments, an array and a hash. 
The array will contain 2 or more elements that, when combined with adjoining 
spaces, will produce a person's name. The hash will contain two keys, 
:title and :occupation, and the appropriate values. 
Your method should return a greeting that uses the person's full name, 
and mentions the person's title.

input
  array, 2 or more elements representing parts of his name (first, m, last)
  hash, :title, :occupation 
output
  print a greeting that includes full name and a reference to his title+occupation

given a hash and array
join the hash with spaces and assign to local variable name
puts "Hello, #{name}. How is working as an #{hash[:title]} at #{hash[:occupation]"
=end

def greetings(arr, hash)
  name = arr.join(' ')
  puts "Hello #{name}. How is working as a #{hash[:title]}"\
       "#{hash[:occupation]}?"
end

# test cases
greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
