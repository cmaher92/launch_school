# how old is teddy

# Build a program that randomly generates and prints Teddy's age. 
# To get the age, you should generate a random number between 20 and 200.

# => Teddy is 69 years old!

# understanding the problem
# input
# output
#   puts Teddy is (random_age) years old
# rules
#   age must be between 20 and 200.

# algorithm
# generate age between 20 and 200
# print sentence

# solution
def print_and_generate_teddys_age
    puts "Teddy is #{rand(20..200)} years old"
end
# test cases
print_and_generate_teddys_age

# further exploration
def print_age()
    puts 'What is your name?'
    name = gets.chomp
    if name.empty?
        puts "Teddy is #{rand(20..200)} years old"
    else
        puts "#{name} is #{rand(20..200)} years old"
    end
end

print_age()
