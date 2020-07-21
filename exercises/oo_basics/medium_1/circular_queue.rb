require 'pry'
# Your task is to write a CircularQueue class that implements a circular
# queue for arbitrary objects. The class should obtain the buffer size with an
# argument provided to CircularQueue::new,
# and should provide the following methods:

# - enqueue to add an object to the queue
# - dequeue to remove (and return) the oldest object in the queue.
#   It should return nil if the queue is empty.

# You may assume that none of the values stored in the queue are nil
# (however, nil may be used to designate empty spots in the buffer).

class CircularQueue
  def initialize(size)
    @buffer = [nil] * size
    @next_position = 0
    @oldest_position = 0
  end

  def enqueue(object)
    # [a b c d], @next = 0, @oldest = 0
    unless @buffer[@next_position].nil? # unless it's nil, do this (full q)
      @oldest_position = increment(@next_position) # @oldest = 1
    end

    @buffer[@next_position] = object # [e, b, c, d]
    @next_position = increment(@next_position) # @next = 1
  end

  def dequeue
    value = @buffer[@oldest_position] # save the obj to local var
    @buffer[@oldest_position] = nil   # set @oldest pos to nil
    @oldest_position = increment(@oldest_position) unless value.nil?
    # increment @oldest unless @oldest was alreay nil (empty)
    value # return value
  end

  private

  def increment(position)
    (position + 1) % @buffer.size
  end
end

# Examples:
# The below code should display true 15 times.

queue = CircularQueue.new(3)
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
