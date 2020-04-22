# welcome stranger
# easy 9, problem 1

# input: Array and Hash
# output:
#   return - nil
#   print - persons full name, and mentions their title and occupation
# rules:
#   - array will contain two or more elements that when combined with adjoining spaces
#     will produce a person's full name.
#   - the hash will contain two keys, :title and :occupation, and string values for
#     their corresponding keys

def greetings(name, job)
  name = name.join(' ')
  occupation = job.values.join(' ')
  puts "Hello ,#{name}! Nice to have a #{occupation} around."  
end
greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

# describe it
# on line 15, the greeting method is defined with name and job as parameters
# on line 20, the greeting method is invoked passing in an array of strings and a Hash as arguments
# on line 16, the name array calls the join method passing in a String object ' ' as an argument, 
#             the return value is assigned to the local variable name
# on line 17, the job hash calls the values method which returns an array of the hashes values
#             then the return value calls the join method passing in a String object ' ' as an argument
#             finally the result a string object is return to the local variable occupation
# on line 18, a string literal is defined interpolating the two local variables name and occupation
#             that string is passed as an argument to the puts method
# the return value is nil, and it outs a string
