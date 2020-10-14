require 'socket'

s = TCPSocket.new 'localhost', 3004

while line = s.gets
  puts s.gets
end

s.close
