def is_prime?(num)
  dividend = 2
  while dividend < num
    return true if num % dividend > 0
    dividend += 1
  end
  false
end

p is_prime?(3) #=> true
p is_prime?(4) #=> false
