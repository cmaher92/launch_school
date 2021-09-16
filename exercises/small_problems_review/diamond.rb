require 'pry'
require 'minitest/autorun'
#

# Details:
# Input: integer: 'n' (will always be odd)
# Output: displays a diamond
# Requirements:
# - 

# EXAMPLES


# DATA STRUCTURE

# ALGORITHM
# 1. create an array from 1...n then from n..-1 excluding even values
#   9 --> [1, 3, 5, 7], [9, 7, 5, 3, 1]
# 2. combine both newly created arrays
# 3. replace the integer in the new array with '*''s

def diamond(num)
    stars = (1...num).step(2).to_a + (num..1).step(-2).to_a

    stars.map! do |num_of_stars|
        ('*' * num_of_stars).center(num).rstrip
    end
    
    puts stars
end

diamond(9)

class Test < Minitest::Test
  def setup
  end

  def test_diamond_single_output
    expect = "*\n"
    assert_output(expect) { diamond(1) }
  end

  def test_diamond
    expect = <<STAR
    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *
STAR
    assert_output(expect) { diamond(9) }
  end

end
