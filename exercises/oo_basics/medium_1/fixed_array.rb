=begin
Fixed Array
A fixed-length array is an array that always has a fixed number of elements.
Write a class that implements a fixed-length array, and provides the necessary
methods to support the following code:
=end

class FixedArray
  def initialize(size)
    @array = Array.new(size)
  end

  def [](index)
    # raise IndexError if index >= array.size || index <= -array.size
    array.fetch(index)
  end

  def []=(index, element)
    self[index] # raises error if index is invalid
    @array[index] = element
  end

  def to_a
    array.clone
  end

  def to_s
    array.to_s
  end

  private

  attr_accessor :array
end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end
