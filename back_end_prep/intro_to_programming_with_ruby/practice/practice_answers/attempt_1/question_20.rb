# Question 20

def greet_user email, options={}
  if options.empty?
    puts "Hello #{email} welcome to my awesome application"
  elsif options[:place] == nil
    puts "Hello #{options[:name]} welcome to my awesome application"
  else
    puts "Hello #{options[:name]}, welcome to my awesome application"
    puts "I hear that #{options[:place]} is a beautiful place to live!"
  end
end

greet_user 'connormmaher@gmail.com', name: 'Connor'
