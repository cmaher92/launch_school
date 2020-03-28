# stringy strings

# input
# integer
# output
# string; 1's and 0's the length of the str
# rules
# start with 1
require 'pry'

def stringy(n, start=true)
  str = ''
  e, o = start ? ['1', '0'] : ['0', '1']
  n.times { |i| i.even? ? str << e : str << o }
  str
end

puts stringy(6) #== '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(3, false) == '010'