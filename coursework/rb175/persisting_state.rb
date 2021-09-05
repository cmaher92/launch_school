require "socket"
require "pry"

def parse_request_line(request_line)
  http_method, path = request_line.split(' ')
  params = {}

  path, query_str = path.split('?')

  if query_str
    query_str = query_str.split('&')
    query_str.each do |pair|
      key, value = pair.split('=')
      params[key] = value
    end
  end

  [http_method, path, params]
end


server = TCPServer.new("localhost", 3003) # creates a new server socket bound to hostname/port
loop do
  client = server.accept # accepts incoming connection, returns TCPSocket object

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/

  http_method, path, params = parse_request_line(request_line)

  client.puts "HTTP/1.1 200 OK" # status-line
  client.puts "Content-Type: text/html" # optional headers
  client.puts "" # need a blank link between body and headers
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"

  client.puts "<h1>Counter</h1>"

  number = params["number"].to_i
  client.puts "<p>The current number is #{number}.</p>"

  # demonstrates that you can use params within url to store basic data
  # in this case, the value for number
  client.puts "<a href='?number=#{number + 1}'>Add one</a>"
  client.puts "<a href='?number=#{number - 1}'>Subtract one</a>"
  client.puts "</body>"
  client.puts "</html>"

  client.close # IO#close; closes stream
end
