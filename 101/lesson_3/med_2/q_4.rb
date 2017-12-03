=begin
To drive that last one home...let's turn the tables and have the string show
a modified output, while the array thwarts the method's efforts to modify
the caller's version of it.
=end

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
id_before = my_string.object_id
tricky_method_two(my_string, my_array)
id_after = my_string.object_id

puts "My string looks like this now: #{my_string}" # pumpkinsrutabaga
puts "My array looks like this now: #{my_array}"   # ["pumpkins"]
puts "Object id before call #{id_before} and after #{id_after}"
# The string is directly modified because the #<< function is mutating
# ruby does not change the object's location in memory, but instead just
# modifies the value directly
