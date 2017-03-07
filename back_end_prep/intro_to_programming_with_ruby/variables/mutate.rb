a = [1, 2, 3]

def mutate(array)
  array.pop
end

p "Before no_mutate method: #{a}"
p mutate(a)
p "After no_mutate method: #{a}"
