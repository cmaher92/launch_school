# drop_while.rb
# review from RB130 exercises, easy 2

# take an array as an arg
# return a new array
# - empty if block never returns false or nil
# - empty if arg empty

def drop_while(arr)
  i = 0
  while i < arr.size && yield(arr[i])
    i += 1
  end
  
  arr[i..-1]
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []