# Question 6

guests = ['connor', 'megan', 'avery', 'john', 'cassie', 'erin', 'geyliah', 'chris']

puts 'What is the guest name that you would like to check?'
name = gets.chomp

puts guests.include?(name) ? 'Yes the guest is on the list' : 'sorry, guest is not on the list'
