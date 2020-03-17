=begin
Question 3

Let's call a method, and pass both a string and an array as parameters and see
how even though they are treated in the same way by Ruby, the results can be
different.

Study the following code and state what will be displayed...and why:

=end

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" # pumpkinsrutabaga
puts "My array looks like this now: #{my_array}"   # pumpkinsrutabaga

# the string and array values are modified by the '+=' and '<<' method
# within the

# I was wrong and I recognize my mistake. the string is not modified because
# it's an assignment operator tied to the '+' method. Assignment operators
# never will mutate the caller.

# however the '<<' method is destructive and as I pointed out mutates the caller
# by adding to the array. 
