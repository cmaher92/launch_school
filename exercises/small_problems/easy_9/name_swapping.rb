# Name Swapping
# Write a method that takes a first name, a space, and a last name passed as a
# single String argument, and returns a string that contains the last name,
# a comma, a space, and the first name.

# input
# - String, 'Connor Maher'
# output
# - String, 'Maher, Connor'

# given a string, split the name on spaces
# return the second element, first element as a string

def swap_name(str)
  full_name = str.split
  "#{full_name[1]}, #{full_name[0]}"
end

# Examples
p swap_name('Joe Roberts') == 'Roberts, Joe'
