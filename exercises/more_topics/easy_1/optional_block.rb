def compute(str)
  block_given? ? yield(str) : 'Does not compute.'
end

p compute('hi') { |str| puts str }
p compute('What is up?') { |greeting| puts greeting }
p compute('test')