class CircularQueue
  def initialize(buffer_size)
    @buffer_size = buffer_size
    @queue = [nil] * buffer_size
    @next = 0
    @rear  = 0
  end

  def enqueue(obj)
    unless @queue[@next].nil?
      @rear = increment(@next) # only increment rear if it's a full queue
    end

    @queue[@next] = obj
    @next = increment(@next) # front now points to next position
  end

  def dequeue
    obj = @queue[@rear]
    @queue[@rear] = nil
    @rear = increment(@rear) unless obj.nil?
    obj
  end

  private

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

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
# # binding.pry
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
