numbers = [1, 2, 3, 4, 5]

def double_numbers!(ary)
  counter = 0
  loop do
    break if counter == ary.length
    # mutating transformation criteria
    ary[counter] *= 2
    counter += 1
  end
  ary
end

p double_numbers!(numbers)