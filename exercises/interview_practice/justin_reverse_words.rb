require 'pry'

a = "hello world"
len = a.length - 1
middle = a.length / 2 - 1


# instead of #upto and #downto method calls
indices = [*0..middle]
reverse_indices = len.downto(middle + 2)
pairs = indices.zip(reverse_indices)

for left_idx, right_idx in pairs
  a[left_idx], a[right_idx] = a[right_idx], a[left_idx]
end

p a


for left_idx, right_idx in 0.step(middle).zip(len.step(middle + 1, -1))
  a[left_idx], a[right_idx] = a[right_idx], a[left_idx]
end

p a


0.upto(middle).zip(len.downto(middle + 1)).each do |left_idx, right_idx|
    a[left_idx], a[right_idx] = a[right_idx], a[left_idx]
  end

p a