def integer_to_string(i)
  i_to_s = (0..9).map { |i| [i, i.to_s] }.to_h
  i.digits.map{ |d| i_to_s[d] }.join.reverse
end

p integer_to_string(4321) #== '4321'
p integer_to_string(0) #== '0'
p integer_to_string(5000) #== '5000'