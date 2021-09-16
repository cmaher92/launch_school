require 'pry'
# require 'minitest/autorun'
#

# Details:
# Input:
# Output:
# Requirements:

# EXAMPLES
# var: 9 --> 11

# DATA STRUCTURE

# ALGORITHM
# 1.

def diamond(num, output: $stdout)
  output.puts " *\n***\n *"

end

io = StringIO.new
diamond(1,output: io)
binding.pry

# class Test < Minitest::Test
#   def setup
#     String
#   end

#   def test_diamond
#     # test
#     # assert_output(@one) { diamond(1) }
#     # assert_output(@three) { diamond(3) }
#     io = StringIO.new
#     binding.pry
#     assert diamond(3, output: io)
#   end
# end
