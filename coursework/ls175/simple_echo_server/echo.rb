require "socket" # classes for networking tasks
require 'pry'

PATTERN = /\/\?(rolls=.+)&(sides=.+)/

def parse_request_line(request)
  request_details = {} #method, #path, #query, version
  details = request.split(' ')
  details[1] = details[1].split('?')
  details = details.flatten

  request_details["method"]  = details[0]
  request_details["path"]    = details[1]
  request_details["query"]   = details[2]
  request_details["version"] = details[3]
  request_details
end

def parse_query(query)
  query_details = {}
  rolls, sides = query.scan(/\d+/)
  query_details["rolls"] = rolls
  query_details["sides"] = sides
  query_details
end

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept
  request_line = client.gets
  next if !request_line || request_line =~ /favicon/

  request = parse_request_line(request_line)

  request["query"] = parse_query(request["query"])

  client.puts "HTTP/1.1 200 OK"
  client.puts "ContentType: text/html"
  client.puts
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts request["method"]
  client.puts request["path"]
  client.puts request["query"]
  client.puts "</pre>"
  client.puts "</body>"
  client.puts "</html>"
  client.close
end
