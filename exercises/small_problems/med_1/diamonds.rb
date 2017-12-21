# Diamonds!
# Write a method that displays a 4-pointed diamond in an n x n grid,
# where n is an odd integer that is supplied as an argument to the method.
# You may assume that the argument will always be an odd integer.

# input
#   integer - represents the diamonds widest point
# output
#   puts a diamond

# given n
# build the rows up to n
# spaces = 8, stars = 1
# spaces = 6, stars = 3
# spaces = 4, stars = 5
# spaces = 2, stars = 7
# spaces = 0, stars = 9

# build a spaces arr
#   build up to n
#   build down to 0

def build_spaces(n)
  spaces = []
  space_count = n-1
  until space_count < 0
    spaces << space_count
    space_count -= 2
  end
  space_count = 0
  until space_count >= n - 1
    space_count += 2
    spaces << space_count
  end
  spaces.map! do |space_count|
    ' ' * (space_count/2)
  end
  spaces
end

def build_stars(n)
  # build up to n
  # build down to 0
  star_count = 1
  stars = []
  until star_count == n
    stars << star_count
    star_count += 2
  end
  until star_count < 1
    stars << star_count
    star_count -= 2
  end
  stars.map! do |star_count|
    "*" * star_count
  end
end

def diamond(n)
  stars  = build_stars(n)
  spaces = build_spaces(n)
  
  spaces.each_with_index do |spaces_str, idx|
    puts "#{spaces_str}#{stars[idx]}#{spaces_str}"
  end
end

# How can I refactor this?
# when building the stars, spaces arr
#   build strings right away, spaces should be half the size


diamond(9)


# Examples
# diamond(1)

# *
# diamond(3)
#
#  *
# ***
#  *
# diamond(9)
#
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *
