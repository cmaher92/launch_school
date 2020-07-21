# create a circular queue with an array using push and shift methods
require 'pry'
class CircularQueue
  def initialize(buffer_size)
    @buffer_size = buffer_size
    @queue = [nil] * buffer_size
    @begin = @buffer_size - 1
    @end = @buffer_size - 1
  end

  def enqueue(obj)
    @begin = decrement(@begin) unless empty? || @begin == 0
    @queue.shift
    @queue.push(obj)
  end

  def dequeue
    return nil if empty?
    rotate until @begin == 0
    value = @queue.shift
    @queue.push(nil)
    @end = decrement(@end)
    rotate until @end == (@buffer_size - 1)
    value
  end

  private

  def empty?
    @queue[@begin].nil?
  end

  def full?
    @begin == 0 && @end == @buffer_size
  end

  def rotate
    value = @queue.shift
    @queue.push(value)
    @begin = decrement(@begin)
    @end = decrement(@end)
  end

  def decrement(position)
    return @buffer_size if position.nil?
    (position - 1) % @buffer_size
  end

  def increment(position)
    (position + 1) % @buffer_size
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1
queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2
# binding.pry
queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
# binding.pry
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
