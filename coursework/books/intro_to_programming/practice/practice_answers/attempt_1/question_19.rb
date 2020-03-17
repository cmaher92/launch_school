# Question 19

# create method that greets the user by email if no name is given
# but if a name and a place are given please greet him by name and include a comment
# about his place of living is really nice

def greet_user email, options={}
  if options.empty?
    puts "Hello #{email} welcome to my awesome application"
  else
    puts "Hello #{options[:name]}, how're you?"
    puts "I hear that #{options[:place]} is a beautiful place to live!"
  end
end

greet_user 'connormmaher@gmail.com', name: 'Connor', place: 'Barnstable'
