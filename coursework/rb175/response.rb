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
  if params.any? # if params contains values roll dice
    client.puts "<h1>Rolls</h1>"
    rolls = params["rolls"].to_i
    sides = params["sides"].to_i

    rolls.times { client.puts "<p>#{(rand(sides) + 1)}</p>" }
  else
    client.puts "You need to specify the number of dice and the number of sides"
  end
  client.puts "</pre>"
  client.puts "</body>"
  client.puts "</html>"

  client.close # IO#close; closes stream
end
