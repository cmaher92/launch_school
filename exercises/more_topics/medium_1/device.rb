class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end
  
  def listen(&block)
    # record if block passed in
    record(yield) if block_given?
  end
  
  def play
    # output most recent recording
    puts self.recordings.last
  end
  
  private
  
  attr_reader :recordings
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"