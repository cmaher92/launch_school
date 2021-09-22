# name_swapping.rb

# I/O
# ----
# input
# - string
#   "first_name last_name"
# - string
#   - "last_name, first_name"

# algo
# ----
# split the name on a space
# last_name + comma + space + first_name

def swap_name(name)
  first, last = name.split(' ')
  "#{last}, #{first}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
