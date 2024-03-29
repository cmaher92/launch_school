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

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/plain"
  client.puts "" # need a blank link between body and headers
  client.puts "Method: #{http_method}"
  client.puts "Path: #{path}"
  client.puts "Parameters: #{params}"

  if params.any? # if params contains values roll dice
    rolls = params["rolls"].to_i
    sides = params["sides"].to_i

    rolls.times { client.puts (rand(sides) + 1) }
  else
    client.puts "You need to specify the number of dice and the number of sides"
  end

  client.close # IO#close; closes stream
end
